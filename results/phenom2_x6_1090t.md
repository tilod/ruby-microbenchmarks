Phenom X6 1080T (6 x 3.2 GHz, 3.6 GHz Turbo Core)
=================================================


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

    direkt assignment (10 entries):        0.300000   0.000000   0.300000 (  0.304476)
    merge (10 entries):                    2.140000   0.000000   2.140000 (  2.146204)
    merge! (10 entries):                   0.870000   0.000000   0.870000 (  0.873415)
    direkt assignment (100 entries):       0.320000   0.000000   0.320000 (  0.319424)
    merge (100 entries):                  11.410000   0.000000  11.410000 ( 11.428895)
    merge! (100 entries):                  0.880000   0.000000   0.880000 (  0.887664)
    direkt assignment (1000 entries):      0.310000   0.000000   0.310000 (  0.305918)
    merge (1000 entries):                108.800000   0.000000 108.800000 (109.063586)
    merge! (1000 entries):                 0.820000   0.000000   0.820000 (  0.816901)


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
send vs. lambda
---------------

    direct method call:                    1.550000   0.090000   1.640000 (  1.646076)
    send (def):                            4.640000   0.000000   4.640000 (  4.656347)
    send (define_method):                  5.180000   0.000000   5.180000 (  5.190553)
    lambda:                                2.610000   0.000000   2.610000 (  2.616750)
