require 'active_model'
require 'benchmark/ips'
require 'faker'
require 'reform'


puts %q{
Reform Performance
==================

(1) ActiveModel:
    Instantiate ActiveModel with params and call #valid?.

(2) Reform with assignment and #valid?
    Instantiate Reform form and assign attributes, then call #valid?.

(3) Reform with #validate:
    Instantiate Reform form and use #validate to assign and validate attributes.


}


def params
  {
    name:    [Faker::Name.name, nil][rand(1)],
    owner:   [Faker::Name.name, nil][rand(1)],
    status:  %(start working end wrong also_wrong)[rand(5)],
    members: [rand(100), "wrong"][rand(1)]
  }
end


class Project
  include ActiveModel::Model

  attr_accessor :name, :owner, :status, :members

  validate :name,    presence: true
  validate :owner,   presence: true
  validate :status,  presence: true, inclusion: { in: %w(start working end) }
  validate :members, presence: true, numericality: true
end


ProjectStruct = Struct.new(:name, :owner, :status, :members)

class ProjectForm < Reform::Form
  property :name
  property :owner
  property :status
  property :members

  validate :name,    presence: true
  validate :owner,   presence: true
  validate :status,  presence: true, inclusion: { in: %w(start working end) }
  validate :members, presence: true, numericality: true
end


Benchmark.ips do |bm|
  bm.report "(1)" do
    model = Project.new(params())
    model.valid?
  end

  bm.report "(2)" do
    model  = ProjectStruct.new
    form   = ProjectForm.new(model)
    params = params()

    form.name    = params[:name]
    form.owner   = params[:owner]
    form.status  = params[:status]
    form.members = params[:members]

    form.valid?
  end

  bm.report "(3)" do
    model = ProjectStruct.new
    form  = ProjectForm.new(model)

    form.validate(params())
  end
end
