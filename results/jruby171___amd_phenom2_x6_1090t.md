JRuby 1.7.1 (HotSpot 1.7.0_09) -- AMD Phenom X6 1090T (@3.2 GHz, @3.6 GHz TurboCore)
====================================================================================


                                               user     system      total        real
array include vs. boolean or
----------------------------

    boolean or (4 parts):                  1.600000   0.150000   1.750000 (  1.234000)
    boolean or (10 parts):                 1.420000   0.040000   1.460000 (  1.235000)
    boolean or (25 parts):                 2.050000   0.000000   2.050000 (  1.869000)
    array.include? (4 parts):              1.220000   0.010000   1.230000 (  1.117000)
    array.include? (10 parts):             1.570000   0.020000   1.590000 (  1.483000)
    array.include? (25 parts):             3.060000   0.010000   3.070000 (  2.882000)


                                               user     system      total        real
Hash: direct assignment vs. merge
---------------------------------

    direct assignment (1000x1):            0.920000   0.040000   0.960000 (  0.461000)
    merge! (1000x1):                       0.750000   0.090000   0.840000 (  0.456000)
    merge (1000x1):                       40.210000   0.240000  40.450000 ( 39.591000)
    direct assignment (100x10):            0.510000   0.000000   0.510000 (  0.368000)
    merge! (100x10):                       0.140000   0.010000   0.150000 (  0.111000)
    merge (100x10):                        3.780000   0.020000   3.800000 (  3.718000)
    direct assignment (10x100):            0.280000   0.000000   0.280000 (  0.239000)
    merge! (10x100):                       0.100000   0.000000   0.100000 (  0.088000)
    merge (10x100):                        0.450000   0.000000   0.450000 (  0.435000)


                                               user     system      total        real
iterative vs. inject
--------------------

    iterative:                             1.440000   0.150000   1.590000 (  1.049000)
    inject (with block):                   1.270000   0.040000   1.310000 (  0.984000)
    inject (&:+):                          1.210000   0.010000   1.220000 (  0.992000)


                                               user     system      total        real
iterative vs. map
-----------------

    iterative:                             2.510000   0.250000   2.760000 (  1.808000)
    map:                                   2.050000   0.010000   2.060000 (  1.835000)


                                               user     system      total        real
iterative vs. map-reduce
------------------------

    iterative:                             1.250000   0.140000   1.390000 (  0.918000)
    map-reduce:                            1.400000   0.010000   1.410000 (  1.011000)


                                               user     system      total        real
send vs. lambda vs. method_missing
----------------------------------

    direct method call (def):              1.970000   0.260000   2.230000 (  1.297000)
    direct method call (define_method):    2.660000   0.010000   2.670000 (  2.322000)
    send (def):                            4.450000   0.030000   4.480000 (  4.078000)
    send (define_method):                  5.740000   0.050000   5.790000 (  5.556000)
    lambda:                                2.610000   0.030000   2.640000 (  2.377000)
    method_missing:                        3.340000   0.010000   3.350000 (  2.994000)
