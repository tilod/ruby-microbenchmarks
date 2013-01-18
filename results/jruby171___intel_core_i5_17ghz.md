JRuby 1.7.1 (HotSpot 1.7.0_07) -- Intel Core i5 @1.7 GHz
========================================================


                                               user     system      total        real
array include vs. boolean or
----------------------------

    boolean or (4 parts):                  1.720000   0.030000   1.750000 (  1.190000)
    boolean or (10 parts):                 1.290000   0.020000   1.310000 (  1.179000)
    boolean or (25 parts):                 1.830000   0.000000   1.830000 (  1.731000)
    array.include? (4 parts):              1.240000   0.010000   1.250000 (  1.072000)
    array.include? (10 parts):             1.590000   0.000000   1.590000 (  1.476000)
    array.include? (25 parts):             2.760000   0.010000   2.770000 (  2.570000)


                                               user     system      total        real
Hash: direct assignment vs. merge
---------------------------------

    direct assignment (1000x1):            1.510000   0.040000   1.550000 (  0.588000)
    merge! (1000x1):                       0.680000   0.040000   0.720000 (  0.496000)
    merge (1000x1):                       28.170000   0.130000  28.300000 ( 27.780000)
    direct assignment (100x10):            0.570000   0.000000   0.570000 (  0.349000)
    merge! (100x10):                       0.090000   0.000000   0.090000 (  0.074000)
    merge (100x10):                        2.650000   0.020000   2.670000 (  2.610000)
    direct assignment (10x100):            0.240000   0.000000   0.240000 (  0.209000)
    merge! (10x100):                       0.080000   0.000000   0.080000 (  0.063000)
    merge (10x100):                        0.300000   0.000000   0.300000 (  0.292000)


                                               user     system      total        real
iterative vs. inject
--------------------

    iterative:                             1.470000   0.060000   1.530000 (  1.009000)
    inject (with block):                   1.410000   0.010000   1.420000 (  1.081000)
    inject (&:+):                          1.180000   0.000000   1.180000 (  0.912000)


                                               user     system      total        real
iterative vs. map
-----------------

    iterative:                             2.120000   0.060000   2.180000 (  1.483000)
    map:                                   1.500000   0.010000   1.510000 (  1.252000)


                                               user     system      total        real
iterative vs. map-reduce
------------------------

    iterative:                             1.250000   0.050000   1.300000 (  0.963000)
    map-reduce:                            1.520000   0.010000   1.530000 (  1.066000)


                                               user     system      total        real
send vs. lambda vs. method_missing
----------------------------------

    direct method call (def):              2.180000   0.070000   2.250000 (  1.320000)
    direct method call (define_method):    2.710000   0.020000   2.730000 (  2.252000)
    send (def, called with string):        4.770000   0.020000   4.790000 (  4.338000)
    send (def, called with symbol):        1.360000   0.000000   1.360000 (  1.253000)
    send (define_method, string):          6.210000   0.040000   6.250000 (  6.064000)
    send (define_method, symbol):          2.620000   0.010000   2.630000 (  2.553000)
    lambda:                                2.720000   0.010000   2.730000 (  2.488000)
    method_missing:                        3.420000   0.020000   3.440000 (  2.977000)
    instance_exec:                         3.600000   0.020000   3.620000 (  3.042000)


