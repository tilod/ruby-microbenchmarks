Ruby 1.9.3-p327 -- Intel Core i5 @1.7 GHz
=========================================


                                               user     system      total        real
array include vs. boolean or
----------------------------

    boolean or (4 parts):                  1.940000   0.000000   1.940000 (  1.944119)
    boolean or (10 parts):                 3.110000   0.000000   3.110000 (  3.104894)
    boolean or (25 parts):                 5.810000   0.000000   5.810000 (  5.818014)
    array.include? (4 parts):              6.310000   0.010000   6.320000 (  6.322221)
    array.include? (10 parts):             9.950000   0.020000   9.970000 (  9.978522)
    array.include? (25 parts):            15.160000   0.180000  15.340000 ( 15.347856)


                                               user     system      total        real
Hash: direct assignment vs. merge
---------------------------------

    direct assignment (1000x1):            0.440000   0.010000   0.450000 (  0.453512)
    merge! (1000x1):                       1.240000   0.020000   1.260000 (  1.270817)
    merge (1000x1):                      155.270000   5.670000 160.940000 (160.936092)
    direct assignment (100x10):            0.570000   0.000000   0.570000 (  0.578379)
    merge! (100x10):                       0.310000   0.010000   0.320000 (  0.317206)
    merge (100x10):                       15.450000   0.550000  16.000000 ( 16.006804)
    direct assignment (10x100):            0.560000   0.000000   0.560000 (  0.555619)
    merge! (10x100):                       0.280000   0.010000   0.290000 (  0.293474)
    merge (10x100):                        1.690000   0.070000   1.760000 (  1.748735)


                                               user     system      total        real
iterative vs. inject
--------------------

    iterative:                             1.360000   0.000000   1.360000 (  1.360442)
    inject (with block):                   1.540000   0.010000   1.550000 (  1.539842)
    inject (&:+):                          1.300000   0.000000   1.300000 (  1.304514)


                                               user     system      total        real
iterative vs. map
-----------------

    iterative:                             2.660000   0.010000   2.670000 (  2.662398)
    map:                                   3.060000   0.000000   3.060000 (  3.066169)


                                               user     system      total        real
iterative vs. map-reduce
------------------------

    iterative:                             1.420000   0.000000   1.420000 (  1.422388)
    map-reduce:                            1.400000   0.000000   1.400000 (  1.404960)


                                               user     system      total        real
send vs. lambda vs. method_missing
----------------------------------

    direct method call (def):              2.420000   0.010000   2.430000 (  2.425864)
    direct method call (define_method):    3.010000   0.000000   3.010000 (  3.012556)
    send (def):                            5.080000   0.000000   5.080000 (  5.083660)
    send (define_method):                  6.000000   0.000000   6.000000 (  5.994515)
    lambda:                                3.490000   0.000000   3.490000 (  3.490920)
    method_missing:                        5.140000   0.010000   5.150000 (  5.141302)
