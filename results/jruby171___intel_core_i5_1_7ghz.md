JRuby 1.7.1 (HotSpot 1.7.0_07) -- Intel Core i5 @1.7 GHz
========================================================


                                               user     system      total        real
array include vs. boolean or
----------------------------

    boolean or (4 parts):                  0.240000   0.000000   0.240000 (  0.148000)
    boolean or (10 parts):                 0.330000   0.000000   0.330000 (  0.206000)
    boolean or (25 parts):                 0.390000   0.000000   0.390000 (  0.285000)
    array.include? (4 parts):              0.300000   0.010000   0.310000 (  0.188000)
    array.include? (10 parts):             0.300000   0.000000   0.300000 (  0.206000)
    array.include? (25 parts):             0.530000   0.000000   0.530000 (  0.373000)


                                               user     system      total        real
Hash: direct assignment vs. merge
---------------------------------

    direct assignment (1000x1):            1.370000   0.040000   1.410000 (  0.532000)
    merge! (1000x1):                       0.590000   0.030000   0.620000 (  0.409000)
    merge (1000x1):                       28.760000   0.140000  28.900000 ( 28.338000)
    direct assignment (100x10):            0.610000   0.010000   0.620000 (  0.365000)
    merge! (100x10):                       0.100000   0.000000   0.100000 (  0.079000)
    merge (100x10):                        2.560000   0.010000   2.570000 (  2.513000)
    direct assignment (10x100):            0.230000   0.000000   0.230000 (  0.195000)
    merge! (10x100):                       0.070000   0.000000   0.070000 (  0.064000)
    merge (10x100):                        0.300000   0.000000   0.300000 (  0.287000)


                                               user     system      total        real
iterative vs. inject
--------------------

    iterative:                            91.840000   0.190000  92.030000 ( 24.301000)
    inject (with block):                 136.070000   0.280000 136.350000 ( 35.850000)
    inject (functional):                 228.400000   0.500000 228.900000 ( 60.288000)


                                               user     system      total        real
iterative vs. map
-----------------

    Error: Your application used more memory than the safety cap of 500M.


                                               user     system      total        real
iterative vs. map-reduce
------------------------

    iterative:                            92.000000   0.190000  92.190000 ( 24.721000)
    map-reduce:                          175.790000   0.340000 176.130000 ( 46.526000)


                                               user     system      total        real
jit cleverness (simple function call)
-------------------------------------

    called every time (simple):          103.830000   0.240000 104.070000 ( 28.003000)
    called before loop (simple):          91.740000   0.210000  91.950000 ( 24.346000)
    called every time (complex):           7.820000   0.080000   7.900000 (  7.375000)
    called before loop (complex):          0.040000   0.000000   0.040000 (  0.012000)


                                               user     system      total        real
send vs. lambda vs. method_missing
----------------------------------

    direct method call (def):            212.630000   0.470000 213.100000 ( 56.492000)
    direct method call (define_method):  583.830000   1.250000 585.080000 (153.375000)
    send (def):                          751.970000   1.610000 753.580000 (198.809000)
    send (define_method):                1265.270000   2.650000 1267.920000 (331.859000)
    lambda:                              674.810000   1.430000 676.240000 (177.338000)
    method_missing:                      621.300000   1.370000 622.670000 (163.938000)
    