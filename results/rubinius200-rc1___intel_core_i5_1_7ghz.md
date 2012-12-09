Rubinius 2.0.0-rc1 -- Intel Core i5 @1.7 GHz
============================================


                                              user     system      total        real
array include vs. boolean or
----------------------------

    boolean or (4 parts):                 0.138451   0.000107   0.138558 (  0.124238)
    boolean or (10 parts):                0.174280   0.000543   0.174823 (  0.144942)
    boolean or (25 parts):                0.188541   0.000486   0.189027 (  0.143129)
    array.include? (4 parts):             0.288274   0.001298   0.289572 (  0.250480)
    array.include? (10 parts):            0.442037   0.001084   0.443121 (  0.418205)
    array.include? (25 parts):            0.838601   0.001068   0.839669 (  0.816948)


                                              user     system      total        real
Hash: direct assignment vs. merge
---------------------------------

    direct assignment (1000x1):           1.214678   0.007393   1.222071 (  0.871434)
    merge! (1000x1):                      2.717918   0.001819   2.719737 (  2.577641)
    merge (1000x1):                     166.807024   0.164724 166.971748 (166.703844)
    direct assignment (100x10):           0.804451   0.000513   0.804964 (  0.718537)
    merge! (100x10):                      0.659022   0.000231   0.659253 (  0.634503)
    merge (100x10):                      16.309420   0.007476  16.316896 ( 16.311572)
    direct assignment (10x100):           0.888485   0.003319   0.891804 (  0.845981)
    merge! (10x100):                      0.636671   0.000951   0.637622 (  0.637936)
    merge (10x100):                       2.580415   0.011364   2.591779 (  2.598288)


                                              user     system      total        real
iterative vs. inject
--------------------

    iterative:                            1.683548   0.001672   1.685220 (  1.680321)
    inject (with block):                  4.672231   0.003726   4.675957 (  4.647647)
    inject (functional):                  5.509483   0.004148   5.513631 (  5.469417)


                                              user     system      total        real
iterative vs. map
-----------------

    iterative:                           38.618038   0.213393  38.831431 ( 38.785505)
    map:                                 23.664628   0.090974  23.755602 ( 23.630076)


                                              user     system      total        real
iterative vs. map-reduce
------------------------

    iterative:                            0.971125   0.001601   0.972726 (  0.957033)
    map-reduce:                           5.768901   0.003103   5.772004 (  5.709182)


                                              user     system      total        real
jit cleverness (simple function call)
-------------------------------------

    called every time (simple):           1.215933   0.000212   1.216145 (  1.210064)
    called before loop (simple):          1.212080   0.000560   1.212640 (  1.194449)
    called every time (complex):         48.699362   0.031277  48.730639 ( 48.669770)
    called before loop (complex):         0.006140   0.000006   0.006146 (  0.006150)


                                              user     system      total        real
send vs. lambda vs. method_missing
----------------------------------

    direct method call (def):             2.267752   0.003222   2.270974 (  2.183997)
    direct method call (define_method):   2.200560   0.001306   2.201866 (  2.182534)
    send (def):                           4.647988   0.001641   4.649629 (  4.643384)
    send (define_method):                 4.574307   0.002730   4.577037 (  4.572988)
    lambda:                               2.260116   0.002396   2.262512 (  2.254796)
    method_missing:                       4.019708   0.006999   4.026707 (  4.012518)
    