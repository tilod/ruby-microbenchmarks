Ruby 1.9.3-p327 -- AMD Phenom X6 1090T (@3.2 GHz, @3.6 GHz TurboCore)
=====================================================================


                                                user     system      total        real
array include vs. boolean or
----------------------------

    boolean or (4 parts):                  1.290000   0.000000   1.290000 (  1.293980)
    boolean or (10 parts):                 2.060000   0.000000   2.060000 (  2.066457)
    boolean or (25 parts):                 3.710000   0.000000   3.710000 (  3.712459)
    array.include? (4 parts):              4.030000   0.000000   4.030000 (  4.048285)
    array.include? (10 parts):             6.290000   0.000000   6.290000 (  6.303692)
    array.include? (25 parts):            11.830000   0.030000  11.860000 ( 11.885856)


                                               user     system      total        real
Hash: direct assignment vs. merge
---------------------------------

    direct assignment (1000x1):            0.320000   0.000000   0.320000 (  0.317185)
    merge! (1000x1):                       0.840000   0.000000   0.840000 (  0.846108)
    merge (1000x1):                      111.080000   0.080000 111.160000 (111.412860)
    direct assignment (100x10):            0.460000   0.000000   0.460000 (  0.461456)
    merge! (100x10):                       0.220000   0.000000   0.220000 (  0.221952)
    merge (100x10):                       11.290000   0.000000  11.290000 ( 11.312352)
    direct assignment (10x100):            0.420000   0.000000   0.420000 (  0.419905)
    merge! (10x100):                       0.190000   0.000000   0.190000 (  0.196623)
    merge (10x100):                        1.230000   0.000000   1.230000 (  1.231837)


                                               user     system      total        real
iterative vs. inject
--------------------

    iterative:                             1.190000   0.000000   1.190000 (  1.190361)
    inject (with block):                   1.460000   0.000000   1.460000 (  1.469911)
    inject (&:+):                          1.250000   0.000000   1.250000 (  1.248866)


                                               user     system      total        real
iterative vs. map
-----------------

    iterative:                             2.690000   0.000000   2.690000 (  2.696246)
    map:                                   2.800000   0.000000   2.800000 (  2.803964)


                                               user     system      total        real
iterative vs. map-reduce
------------------------

    iterative:                             1.260000   0.000000   1.260000 (  1.265697)
    map-reduce:                            1.340000   0.000000   1.340000 (  1.341427)


                                               user     system      total        real
send vs. lambda vs. method_missing
----------------------------------

    direct method call (def):              1.890000   0.000000   1.890000 (  1.893501)
    direct method call (define_method):    2.330000   0.000000   2.330000 (  2.340405)
    send (def):                            4.860000   0.000000   4.860000 (  4.865193)
    send (define_method):                  5.290000   0.000000   5.290000 (  5.308476)
    lambda:                                2.700000   0.000000   2.700000 (  2.698426)
    method_missing:                        3.970000   0.000000   3.970000 (  3.986197)
