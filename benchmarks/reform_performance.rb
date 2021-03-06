require 'active_model'
require 'benchmark/ips'
require 'faker'
require 'reform'
require 'reform/form/active_model/validations'

Reform::Form.class_eval do
  include Reform::Form::ActiveModel::Validations
end


puts <<-DOC

REFORM PERFORMANCE

(1) ActiveModel:
    Instantiate ActiveModel with params and call #valid?.

(2) Reform w/ #valid?
    Instantiate Reform form and assign attributes, then call #valid?.

(3) Reform w/ #validate:
    Instantiate Reform form and use #validate to assign and validate attributes.

DOC


def params
  {
    name:    [Faker::Name.name, nil][rand(1)],
    owner:   [Faker::Name.name, nil][rand(1)],
    status:  %w(start working end wrong also_wrong)[rand(5)],
    members: [rand(100), 'wrong'][rand(1)]
  }
end


class Project
  include ActiveModel::Model

  attr_accessor :name, :owner, :status, :members

  validates :name,    presence: true
  validates :owner,   presence: true
  validates :status,  presence: true, inclusion: { in: %w(start working end) }
  validates :members, presence: true, numericality: true
end


ProjectStruct = Struct.new(:name, :owner, :status, :members)

class ProjectForm < Reform::Form
  property :name
  property :owner
  property :status
  property :members

  validates :name,    presence: true
  validates :owner,   presence: true
  validates :status,  presence: true, inclusion: { in: %w(start working end) }
  validates :members, presence: true, numericality: true
end


Benchmark.ips do |bm|
  bm.report 'ActiveModel' do
    model = Project.new(params())
    model.valid?
  end

  bm.report 'Reform w/ #valid?' do
    model  = ProjectStruct.new
    form   = ProjectForm.new(model)
    params = params()

    form.name    = params[:name]
    form.owner   = params[:owner]
    form.status  = params[:status]
    form.members = params[:members]

    form.valid?
  end

  bm.report 'Reform w/ #validate' do
    model = ProjectStruct.new
    form  = ProjectForm.new(model)

    form.validate(params())
  end
end
