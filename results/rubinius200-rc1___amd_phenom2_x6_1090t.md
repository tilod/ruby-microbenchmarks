Rubinius 2.0.0-rc1 -- AMD Phenom X6 1090T (@3.2 GHz, @3.6 GHz TurboCore)
========================================================================


                                              user     system      total        real
array include vs. boolean or
----------------------------

    boolean or (4 parts):                 0.119992   0.000000   0.119992 (  0.124408)
    boolean or (10 parts):                0.133324   0.000000   0.133324 (  0.136987)
    boolean or (25 parts):                0.123326   0.000000   0.123326 (  0.123377)
    array.include? (4 parts):             0.213319   0.000000   0.213319 (  0.214902)
    array.include? (10 parts):            0.353310   0.000000   0.353310 (  0.356079)
    array.include? (25 parts):            0.666623   0.000000   0.666623 (  0.671905)


                                              user     system      total        real
Hash: direct assignment vs. merge
---------------------------------

    direct assignment (1000x1):           0.656624   0.000000   0.656624 (  0.659291)
    merge! (1000x1):                      1.916542   0.000000   1.916542 (  1.921761)
    merge (1000x1):                     128.014986   0.000000 128.014986 (128.323704)
    direct assignment (100x10):           0.589961   0.000000   0.589961 (  0.590795)
    merge! (100x10):                      0.486635   0.000000   0.486635 (  0.488805)
    merge (100x10):                      12.875827   0.000000  12.875827 ( 12.909265)
    direct assignment (10x100):           0.629959   0.000000   0.629959 (  0.632469)
    merge! (10x100):                      0.459970   0.000000   0.459970 (  0.462380)
    merge (10x100):                       1.616561   0.000000   1.616561 (  1.626140)


                                              user     system      total        real
iterative vs. inject
--------------------

    iterative:                            1.699889   0.000000   1.699889 (  1.705507)
    inject (with block):                  3.623097   0.000000   3.623097 (  3.632953)
    inject (functional):                  4.483041   0.000000   4.483041 (  4.494548)


                                              user     system      total        real
iterative vs. map
-----------------

    iterative:                           34.717736   0.136658  34.854394 ( 34.937286)
    map:                                 21.431936   0.049996  21.481932 ( 21.534454)


                                              user     system      total        real
iterative vs. map-reduce
------------------------

    iterative:                            0.919940   0.006666   0.926606 (  0.934085)
    map-reduce:                           4.049736   0.026665   4.076401 (  4.085598)


                                              user     system      total        real
jit cleverness (simple function call)
-------------------------------------

    called every time (simple):           1.243252   0.010000   1.253252 (  1.257354)
    called before loop (simple):          1.239920   0.019998   1.259918 (  1.263590)
    called every time (complex):         44.523763   0.196654  44.720417 ( 44.831292)
    called before loop (complex):         0.003333   0.000000   0.003333 (  0.005913)


                                              user     system      total        real
send vs. lambda vs. method_missing
----------------------------------

    direct method call (def):             2.189857   0.000000   2.189857 (  2.194519)
    direct method call (define_method):   2.026534   0.000000   2.026534 (  2.034685)
    send (def):                           3.983073   0.000000   3.983073 (  3.995510)
    send (define_method):                 4.013072   0.000000   4.013072 (  4.022014)
    lambda:                               1.929874   0.000000   1.929874 (  1.935100)
    method_missing:                       3.226457   0.000000   3.226457 (  3.238511)
