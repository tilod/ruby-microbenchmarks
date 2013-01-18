Ruby MRI 1.9.3-p362 -- Intel Core i5 @1.7 GHz
=============================================

                                               user     system      total        real
array include vs. boolean or
----------------------------

    boolean or (4 parts):                  2.060000   0.000000   2.060000 (  2.059382)
    boolean or (10 parts):                 3.170000   0.000000   3.170000 (  3.171571)
    boolean or (25 parts):                 5.790000   0.000000   5.790000 (  5.790937)
    array.include? (4 parts):              5.830000   0.000000   5.830000 (  5.838375)
    array.include? (10 parts):             8.460000   0.000000   8.460000 (  8.466091)
    array.include? (25 parts):            14.370000   0.120000  14.490000 ( 14.482664)


                                               user     system      total        real
Hash: direct assignment vs. merge
---------------------------------

    direct assignment (1000x1):            0.430000   0.010000   0.440000 (  0.440757)
    merge! (1000x1):                       1.230000   0.020000   1.250000 (  1.254662)
    merge (1000x1):                      153.250000   4.860000 158.110000 (158.141223)
    direct assignment (100x10):            0.580000   0.000000   0.580000 (  0.581652)
    merge! (100x10):                       0.290000   0.010000   0.300000 (  0.302981)
    merge (100x10):                       15.480000   0.480000  15.960000 ( 15.960385)
    direct assignment (10x100):            0.530000   0.000000   0.530000 (  0.529618)
    merge! (10x100):                       0.290000   0.010000   0.300000 (  0.298878)
    merge (10x100):                        1.690000   0.050000   1.740000 (  1.739287)


                                               user     system      total        real
iterative vs. inject
--------------------

    iterative:                             1.530000   0.000000   1.530000 (  1.533227)
    inject (with block):                   1.540000   0.000000   1.540000 (  1.539358)
    inject (&:+):                          1.300000   0.000000   1.300000 (  1.304396)


                                               user     system      total        real
iterative vs. map
-----------------

    iterative:                             4.050000   0.010000   4.060000 (  4.056692)
    map:                                   2.320000   0.000000   2.320000 (  2.314925)


                                               user     system      total        real
iterative vs. map-reduce
------------------------

    iterative:                             1.470000   0.000000   1.470000 (  1.473824)
    map-reduce:                            1.410000   0.000000   1.410000 (  1.406295)


                                               user     system      total        real
send vs. lambda vs. method_missing
----------------------------------

    direct method call (def):              2.460000   0.010000   2.470000 (  2.460151)
    direct method call (define_method):    2.910000   0.000000   2.910000 (  2.918148)
    send (def, called with string):        5.070000   0.000000   5.070000 (  5.066242)
    send (def, called with symbol):        2.710000   0.000000   2.710000 (  2.711317)
    send (define_method, string):          5.480000   0.000000   5.480000 (  5.485023)
    send (define_method, symbol):          3.140000   0.000000   3.140000 (  3.146507)
    lambda:                                3.440000   0.000000   3.440000 (  3.446814)
    method_missing:                        5.300000   0.010000   5.310000 (  5.309210)
    instance_exec:                         5.180000   0.000000   5.180000 (  5.183677)


