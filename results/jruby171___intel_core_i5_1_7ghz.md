JRuby 1.7.1 (HotSpot 1.7.0_07) -- Intel Core i5 @1.7 GHz
========================================================


                                               user     system      total        real
array include vs. boolean or
----------------------------

    boolean or (4 parts):                  1.860000   0.040000   1.900000 (  1.323000)
    boolean or (10 parts):                 1.340000   0.030000   1.370000 (  1.199000)
    boolean or (25 parts):                 1.930000   0.000000   1.930000 (  1.780000)
    array.include? (4 parts):              1.170000   0.010000   1.180000 (  1.029000)
    array.include? (10 parts):             1.500000   0.010000   1.510000 (  1.380000)
    array.include? (25 parts):             2.710000   0.010000   2.720000 (  2.529000)


                                               user     system      total        real
Hash: direct assignment vs. merge
---------------------------------

    direct assignment (1000x1):            1.470000   0.040000   1.510000 (  0.569000)
    merge! (1000x1):                       0.570000   0.030000   0.600000 (  0.398000)
    merge (1000x1):                       27.820000   0.110000  27.930000 ( 27.397000)
    direct assignment (100x10):            0.610000   0.010000   0.620000 (  0.380000)
    merge! (100x10):                       0.090000   0.000000   0.090000 (  0.076000)
    merge (100x10):                        2.590000   0.010000   2.600000 (  2.534000)
    direct assignment (10x100):            0.230000   0.000000   0.230000 (  0.200000)
    merge! (10x100):                       0.070000   0.000000   0.070000 (  0.066000)
    merge (10x100):                        0.300000   0.000000   0.300000 (  0.290000)


                                               user     system      total        real
iterative vs. inject
--------------------

    iterative:                             1.400000   0.060000   1.460000 (  0.968000)
    inject (with block):                   1.340000   0.000000   1.340000 (  1.013000)
    inject (&:+):                          1.170000   0.010000   1.180000 (  0.911000)


                                               user     system      total        real
iterative vs. map
-----------------

    iterative:                             2.390000   0.070000   2.460000 (  1.682000)
    map:                                   1.880000   0.010000   1.890000 (  1.668000)


                                               user     system      total        real
iterative vs. map-reduce
------------------------

    iterative:                             1.170000   0.060000   1.230000 (  0.890000)
    map-reduce:                            1.490000   0.010000   1.500000 (  1.048000)


                                               user     system      total        real
send vs. lambda vs. method_missing
----------------------------------

    direct method call (def):              1.990000   0.060000   2.050000 (  1.228000)
    direct method call (define_method):    2.690000   0.020000   2.710000 (  2.226000)
    send (def):                            4.660000   0.020000   4.680000 (  4.213000)
    send (define_method):                  5.610000   0.020000   5.630000 (  5.447000)
    lambda:                                2.390000   0.010000   2.400000 (  2.214000)
    method_missing:                        3.130000   0.020000   3.150000 (  2.739000)
    instance_exec:                         3.360000   0.020000   3.380000 (  2.825000)
