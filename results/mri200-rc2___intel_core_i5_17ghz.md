Ruby MRI 2.0.0-rc2 -- Intel Core i5 @1.7 GHz
============================================

                                               user     system      total        real
array include vs. boolean or
----------------------------

    boolean or (4 parts):                  1.550000   0.000000   1.550000 (  1.545746)
    boolean or (10 parts):                 2.290000   0.000000   2.290000 (  2.297597)
    boolean or (25 parts):                 4.020000   0.000000   4.020000 (  4.025789)
    array.include? (4 parts):              6.500000   0.000000   6.500000 (  6.501282)
    array.include? (10 parts):             9.200000   0.010000   9.210000 (  9.212112)
    array.include? (25 parts):            15.410000   0.070000  15.480000 ( 15.484454)


                                               user     system      total        real
Hash: direct assignment vs. merge
---------------------------------

    direct assignment (1000x1):            0.420000   0.010000   0.430000 (  0.440700)
    merge! (1000x1):                       1.180000   0.020000   1.200000 (  1.193710)
    merge (1000x1):                      234.140000   5.690000 239.830000 (239.840079)
    direct assignment (100x10):            0.690000   0.000000   0.690000 (  0.695820)
    merge! (100x10):                       0.340000   0.010000   0.350000 (  0.354023)
    merge (100x10):                       24.810000   0.590000  25.400000 ( 25.392807)
    direct assignment (10x100):            0.650000   0.000000   0.650000 (  0.656899)
    merge! (10x100):                       0.310000   0.010000   0.320000 (  0.317960)
    merge (10x100):                        2.470000   0.050000   2.520000 (  2.524421)


                                               user     system      total        real
iterative vs. inject
--------------------

    iterative:                             0.850000   0.000000   0.850000 (  0.846375)
    inject (with block):                   1.310000   0.000000   1.310000 (  1.315606)
    inject (&:+):                          1.450000   0.000000   1.450000 (  1.447585)


                                               user     system      total        real
iterative vs. map
-----------------

    iterative:                             3.220000   0.000000   3.220000 (  3.227591)
    map:                                   2.010000   0.000000   2.010000 (  2.005202)


                                               user     system      total        real
iterative vs. map-reduce
------------------------

    iterative:                             0.870000   0.000000   0.870000 (  0.862099)
    map-reduce:                            1.460000   0.000000   1.460000 (  1.469350)


                                               user     system      total        real
send vs. lambda vs. method_missing
----------------------------------

    direct method call (def):              1.650000   0.000000   1.650000 (  1.645592)
    direct method call (define_method):    2.370000   0.000000   2.370000 (  2.375819)
    send (def, called with string):        5.040000   0.000000   5.040000 (  5.049318)
    send (def, called with symbol):        2.150000   0.000000   2.150000 (  2.146841)
    send (define_method, string):          5.630000   0.000000   5.630000 (  5.636503)
    send (define_method, symbol):          2.810000   0.010000   2.820000 (  2.816580)
    lambda:                                2.700000   0.000000   2.700000 (  2.697800)
    method_missing:                        4.300000   0.000000   4.300000 (  4.311727)
    instance_exec:                         5.760000   0.010000   5.770000 (  5.769397)
