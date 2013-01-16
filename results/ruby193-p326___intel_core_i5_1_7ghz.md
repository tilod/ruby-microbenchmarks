Ruby 1.9.3-p362 -- Intel Core i5 @1.7 GHz
=========================================


                                               user     system      total        real
array include vs. boolean or
----------------------------

    boolean or (4 parts):                  2.050000   0.000000   2.050000 (  2.050848)
    boolean or (10 parts):                 3.170000   0.000000   3.170000 (  3.178377)
    boolean or (25 parts):                 5.720000   0.000000   5.720000 (  5.718409)
    array.include? (4 parts):              5.930000   0.000000   5.930000 (  5.932343)
    array.include? (10 parts):             8.410000   0.010000   8.420000 (  8.413626)
    array.include? (25 parts):            14.470000   0.170000  14.640000 ( 14.632994)


                                               user     system      total        real
Hash: direct assignment vs. merge
---------------------------------

    direct assignment (1000x1):            0.430000   0.010000   0.440000 (  0.441156)
    merge! (1000x1):                       1.250000   0.030000   1.280000 (  1.281811)
    merge (1000x1):                      153.150000   5.750000 158.900000 (158.917448)
    direct assignment (100x10):            0.610000   0.000000   0.610000 (  0.612577)
    merge! (100x10):                       0.300000   0.010000   0.310000 (  0.310880)
    merge (100x10):                       15.590000   0.580000  16.170000 ( 16.166739)
    direct assignment (10x100):            0.580000   0.000000   0.580000 (  0.587929)
    merge! (10x100):                       0.300000   0.020000   0.320000 (  0.307075)
    merge (10x100):                        1.720000   0.060000   1.780000 (  1.785988)


                                               user     system      total        real
iterative vs. inject
--------------------

    iterative:                             1.530000   0.000000   1.530000 (  1.533234)
    inject (with block):                   1.540000   0.000000   1.540000 (  1.541246)
    inject (&:+):                          1.320000   0.000000   1.320000 (  1.320683)


                                               user     system      total        real
iterative vs. map
-----------------

    iterative:                             2.600000   0.000000   2.600000 (  2.604819)
    map:                                   2.990000   0.000000   2.990000 (  2.990158)


                                               user     system      total        real
iterative vs. map-reduce
------------------------

    iterative:                             1.440000   0.000000   1.440000 (  1.441911)
    map-reduce:                            1.430000   0.000000   1.430000 (  1.424959)


                                               user     system      total        real
send vs. lambda vs. method_missing
----------------------------------

    direct method call (def):              2.400000   0.000000   2.400000 (  2.406455)
    direct method call (define_method):    2.950000   0.000000   2.950000 (  2.945711)
    send (def):                            5.090000   0.000000   5.090000 (  5.099202)
    send (define_method):                  5.580000   0.000000   5.580000 (  5.576379)
    lambda:                                3.470000   0.000000   3.470000 (  3.475185)
    method_missing:                        5.180000   0.010000   5.190000 (  5.184363)
    instance_exec:                         5.160000   0.000000   5.160000 (  5.160834)
