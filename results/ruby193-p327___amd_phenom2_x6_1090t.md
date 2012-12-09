Ruby 1.9.3-p327 -- AMD Phenom X6 1090T (@3.2 GHz, @3.6 GHz TurboCore)
=====================================================================


                                               user     system      total        real
array include vs. boolean or
----------------------------

    boolean or (4 parts):                  0.140000   0.000000   0.140000 (  0.132030)
    boolean or (10 parts):                 0.200000   0.000000   0.200000 (  0.204961)
    boolean or (25 parts):                 0.360000   0.000000   0.360000 (  0.363929)
    array.include? (4 parts):              0.710000   0.000000   0.710000 (  0.703370)
    array.include? (10 parts):             0.940000   0.000000   0.940000 (  0.948312)
    array.include? (25 parts):             1.490000   0.000000   1.490000 (  1.493429)


                                               user     system      total        real
Hash: direct assignment vs. merge
---------------------------------

    direct assignment (1000x1):            0.310000   0.000000   0.310000 (  0.315653)
    merge! (1000x1):                       0.860000   0.000000   0.860000 (  0.854674)
    merge (1000x1):                      110.860000   0.320000 111.180000 (111.437552)
    direct assignment (100x10):            0.460000   0.000000   0.460000 (  0.462938)
    merge! (100x10):                       0.230000   0.000000   0.230000 (  0.226847)
    merge (100x10):                       11.330000   0.020000  11.350000 ( 11.385373)
    direct assignment (10x100):            0.420000   0.000000   0.420000 (  0.423829)
    merge! (10x100):                       0.220000   0.000000   0.220000 (  0.218455)
    merge (10x100):                        1.220000   0.000000   1.220000 (  1.215801)


                                               user     system      total        real
iterative vs. inject
--------------------

    iterative:                             0.900000   0.100000   1.000000 (  1.001885)
    inject (with block):                   1.350000   0.000000   1.350000 (  1.359217)
    inject (functional):                   1.250000   0.000000   1.250000 (  1.249539)


                                               user     system      total        real
iterative vs. map
-----------------

    iterative:                             3.020000   0.190000   3.210000 (  3.219898)
    map:                                   2.720000   0.190000   2.910000 (  2.923582)


                                               user     system      total        real
iterative vs. map-reduce
------------------------

    iterative:                             1.080000   0.120000   1.200000 (  1.202322)
    map-reduce:                            1.300000   0.000000   1.300000 (  1.303637)


                                               user     system      total        real
jit cleverness (simple function call)
-------------------------------------

    called every time (simple):            0.700000   0.000000   0.700000 (  0.699013)
    called before loop (simple):           0.640000   0.000000   0.640000 (  0.640834)
    called every time (complex):          11.890000   0.140000  12.030000 ( 12.057553)
    called before loop (complex):          0.000000   0.000000   0.000000 (  0.001878)


                                               user     system      total        real
send vs. lambda vs. method_missing
----------------------------------

    direct method call (def):              1.550000   0.090000   1.640000 (  1.653343)
    direct method call (define_method):    2.120000   0.010000   2.130000 (  2.126061)
    send (def):                            4.790000   0.000000   4.790000 (  4.800868)
    send (define_method):                  5.190000   0.000000   5.190000 (  5.193758)
    lambda:                                2.590000   0.000000   2.590000 (  2.603742)
    method_missing:                        3.970000   0.000000   3.970000 (  3.974836)