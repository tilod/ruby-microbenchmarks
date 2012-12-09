Ruby 1.9.3-p327 -- Intel Core i5 @1.7 GHz
=========================================


                                               user     system      total        real
array include vs. boolean or
----------------------------

    boolean or (4 parts):                  0.200000   0.000000   0.200000 (  0.193476)
    boolean or (10 parts):                 0.300000   0.000000   0.300000 (  0.302679)
    boolean or (25 parts):                 0.540000   0.000000   0.540000 (  0.543729)
    array.include? (4 parts):              0.860000   0.000000   0.860000 (  0.854148)
    array.include? (10 parts):             1.130000   0.000000   1.130000 (  1.131692)
    array.include? (25 parts):             1.740000   0.010000   1.750000 (  1.750878)


                                               user     system      total        real
Hash: direct assignment vs. merge
---------------------------------

    direct assignment (1000x1):            0.440000   0.010000   0.450000 (  0.452439)
    merge! (1000x1):                       1.280000   0.020000   1.300000 (  1.305289)
    merge (1000x1):                      157.040000   5.590000 162.630000 (162.630308)
    direct assignment (100x10):            0.620000   0.000000   0.620000 (  0.621790)
    merge! (100x10):                       0.300000   0.010000   0.310000 (  0.311041)
    merge (100x10):                       15.790000   0.560000  16.350000 ( 16.347382)
    direct assignment (10x100):            0.550000   0.000000   0.550000 (  0.552722)
    merge! (10x100):                       0.310000   0.010000   0.320000 (  0.320023)
    merge (10x100):                        1.730000   0.060000   1.790000 (  1.785051)


                                               user     system      total        real
iterative vs. inject
--------------------

    iterative:                             2.140000   0.120000   2.260000 (  2.258579)
    inject (with block):                   1.460000   0.010000   1.470000 (  1.467772)
    inject (functional):                   1.260000   0.000000   1.260000 (  1.264671)


                                               user     system      total        real
iterative vs. map
-----------------

    iterative:                             4.400000   0.230000   4.630000 (  4.625547)
    map:                                   5.990000   0.270000   6.260000 (  6.270148)


                                               user     system      total        real
iterative vs. map-reduce
------------------------

    iterative:                             1.770000   0.100000   1.870000 (  1.879400)
    map-reduce:                            1.330000   0.010000   1.340000 (  1.332640)


                                               user     system      total        real
jit cleverness (simple function call)
-------------------------------------

    called every time (simple):            1.030000   0.000000   1.030000 (  1.036830)
    called before loop (simple):           0.950000   0.010000   0.960000 (  0.952381)
    called every time (complex):          13.460000   0.130000  13.590000 ( 13.603277)
    called before loop (complex):          0.010000   0.000000   0.010000 (  0.002395)


                                               user     system      total        real
send vs. lambda vs. method_missing
----------------------------------

    direct method call (def):              3.520000   0.130000   3.650000 (  3.645758)
    direct method call (define_method):    2.860000   0.010000   2.870000 (  2.863805)
    send (def):                            5.840000   0.000000   5.840000 (  5.846887)
    send (define_method):                  6.380000   0.000000   6.380000 (  6.385534)
    lambda:                                3.870000   0.030000   3.900000 (  3.890945)
    method_missing:                        5.090000   0.010000   5.100000 (  5.102003)
    