Rubinius 2.0.0-rc1 -- AMD Phenom X6 1090T (@3.2 GHz, @3.6 GHz TurboCore)
========================================================================


                                              user     system      total        real
array include vs. boolean or
----------------------------

    boolean or (4 parts):                 0.516633   0.000000   0.516633 (  0.521014)
    boolean or (10 parts):                0.623293   0.000000   0.623293 (  0.624000)
    boolean or (25 parts):                0.866610   0.000000   0.866610 (  0.872322)
    array.include? (4 parts):             1.903209   0.000000   1.903209 (  1.907420)
    array.include? (10 parts):            3.416444   0.000000   3.416444 (  3.426522)
    array.include? (25 parts):            6.749560   0.000000   6.749560 (  6.764161)


                                              user     system      total        real
Hash: direct assignment vs. merge
---------------------------------

    direct assignment (1000x1):           0.689955   0.000000   0.689955 (  0.694354)
    merge! (1000x1):                      2.026534   0.000000   2.026534 (  2.030453)
    merge (1000x1):                     123.821927   0.010000 123.831927 (124.131545)
    direct assignment (100x10):           0.609960   0.000000   0.609960 (  0.612369)
    merge! (100x10):                      0.489968   0.000000   0.489968 (  0.493195)
    merge (100x10):                      12.379193   0.000000  12.379193 ( 12.411684)
    direct assignment (10x100):           0.653291   0.000000   0.653291 (  0.654358)
    merge! (10x100):                      0.459970   0.000000   0.459970 (  0.460955)
    merge (10x100):                       1.513235   0.003333   1.516568 (  1.523268)


                                              user     system      total        real
iterative vs. inject
--------------------

    iterative:                            0.906608   0.000000   0.906608 (  0.909512)
    inject (with block):                  3.013137   0.019999   3.033136 (  3.041205)
    inject (&:+):                         5.083002   0.019999   5.103001 (  5.119362)


                                              user     system      total        real
iterative vs. map
-----------------

    iterative:                            1.983204   0.000000   1.983204 (  1.990473)
    map:                                  2.969806   0.000000   2.969806 (  2.978804)


                                              user     system      total        real
iterative vs. map-reduce
------------------------

    iterative:                            0.629959   0.000000   0.629959 (  0.633990)
    map-reduce:                           3.763088   0.000000   3.763088 (  3.774545)


                                              user     system      total        real
send vs. lambda vs. method_missing
----------------------------------

    direct method call (def):             1.729887   0.000000   1.729887 (  1.732642)
    direct method call (define_method):   1.683224   0.000000   1.683224 (  1.688537)
    send (def):                           3.836417   0.000000   3.836417 (  3.845897)
    send (define_method):                 3.959741   0.000000   3.959741 (  3.968479)
    lambda:                               1.976538   0.000000   1.976538 (  1.979759)
    method_missing:                       3.309784   0.000000   3.309784 (  3.316073)
