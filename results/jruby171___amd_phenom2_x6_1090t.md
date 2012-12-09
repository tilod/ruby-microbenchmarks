JRuby 1.7.1 (HotSpot 1.7.0_09) -- AMD Phenom X6 1090T (@3.2 GHz, @3.6 GHz TurboCore)
====================================================================================


                                               user     system      total        real
array include vs. boolean or
----------------------------

    boolean or (4 parts):                  0.200000   0.010000   0.210000 (  0.143000)
    boolean or (10 parts):                 0.380000   0.030000   0.410000 (  0.206000)
    boolean or (25 parts):                 0.350000   0.000000   0.350000 (  0.265000)
    array.include? (4 parts):              0.340000   0.060000   0.400000 (  0.198000)
    array.include? (10 parts):             0.330000   0.050000   0.380000 (  0.209000)
    array.include? (25 parts):             0.530000   0.000000   0.530000 (  0.348000)


                                               user     system      total        real
Hash: direct assignment vs. merge
---------------------------------

    direct assignment (1000x1):            0.940000   0.010000   0.950000 (  0.446000)
    merge! (1000x1):                       0.720000   0.090000   0.810000 (  0.452000)
    merge (1000x1):                       40.630000   0.290000  40.920000 ( 40.085000)
    direct assignment (100x10):            0.520000   0.000000   0.520000 (  0.365000)
    merge! (100x10):                       0.140000   0.000000   0.140000 (  0.117000)
    merge (100x10):                        3.810000   0.010000   3.820000 (  3.752000)
    direct assignment (10x100):            0.280000   0.020000   0.300000 (  0.243000)
    merge! (10x100):                       0.100000   0.000000   0.100000 (  0.087000)
    merge (10x100):                        0.450000   0.000000   0.450000 (  0.431000)


                                               user     system      total        real
iterative vs. inject
--------------------

    iterative:                            62.930000   0.440000  63.370000 ( 12.309000)
    inject (with block):                  89.040000   0.650000  89.690000 ( 17.365000)
    inject (functional):                 162.820000   1.210000 164.030000 ( 31.065000)


                                               user     system      total        real
iterative vs. map
-----------------

    Error: Your application used more memory than the safety cap of 500M.


                                               user     system      total        real
iterative vs. map-reduce
------------------------

    iterative:                            60.220000   0.410000  60.630000 ( 12.088000)
    map-reduce:                          120.210000   0.720000 120.930000 ( 23.536000)


                                               user     system      total        real
jit cleverness (simple function call)
-------------------------------------

    called every time (simple):           98.320000   0.740000  99.060000 ( 19.118000)
    called before loop (simple):          37.460000   0.290000  37.750000 (  7.517000)
    called every time (complex):           8.390000   0.130000   8.520000 (  7.810000)
    called before loop (complex):          0.020000   0.000000   0.020000 (  0.007000)


                                               user     system      total        real
send vs. lambda vs. method_missing
----------------------------------

    direct method call (def):            143.260000   1.060000 144.320000 ( 27.684000)
    direct method call (define_method):  412.860000   3.240000 416.100000 ( 78.985000)
    send (def):                          527.550000   3.850000 531.400000 (101.907000)
    send (define_method):                879.920000   6.700000 886.620000 (169.101000)
    lambda:                              463.650000   3.730000 467.380000 ( 88.808000)
    method_missing:                      434.790000   3.460000 438.250000 ( 83.658000)
