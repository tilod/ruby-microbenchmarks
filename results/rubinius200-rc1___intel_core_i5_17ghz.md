Rubinius 2.0.0-rc1 -- Intel Core i5 @1.7 GHz
============================================

                                              user     system      total        real
array include vs. boolean or
----------------------------

    boolean or (4 parts):                 0.604269   0.001885   0.606154 (  0.582899)
    boolean or (10 parts):                0.715967   0.000923   0.716890 (  0.693200)
    boolean or (25 parts):                0.988550   0.001403   0.989953 (  0.952935)
    array.include? (4 parts):             2.253085   0.003379   2.256464 (  2.219526)
    array.include? (10 parts):            4.090378   0.003009   4.093387 (  4.062909)
    array.include? (25 parts):            7.763045   0.004269   7.767314 (  7.744388)


                                              user     system      total        real
Hash: direct assignment vs. merge
---------------------------------

    direct assignment (1000x1):           1.139052   0.006396   1.145448 (  0.826268)
    merge! (1000x1):                      2.667919   0.005811   2.673730 (  2.540931)
    merge (1000x1):                     172.782870   0.162248 172.945118 (172.718941)
    direct assignment (100x10):           0.841872   0.000892   0.842764 (  0.741644)
    merge! (100x10):                      0.689101   0.000355   0.689456 (  0.665139)
    merge (100x10):                      17.067405   0.009263  17.076668 ( 17.074781)
    direct assignment (10x100):           0.856036   0.000869   0.856905 (  0.804278)
    merge! (10x100):                      0.683271   0.000234   0.683505 (  0.683586)
    merge (10x100):                       2.222294   0.001241   2.223535 (  2.223793)


                                              user     system      total        real
iterative vs. inject
--------------------

    iterative:                            0.994951   0.003728   0.998679 (  0.977731)
    inject (with block):                  3.612116   0.004342   3.616458 (  3.602636)
    inject (&:+):                         6.368810   0.006764   6.375574 (  6.318962)


                                              user     system      total        real
iterative vs. map
-----------------

    iterative:                            8.321973   0.016700   8.338673 (  8.142524)
    map:                                  2.926846   0.003372   2.930218 (  2.843621)


                                              user     system      total        real
iterative vs. map-reduce
------------------------

    iterative:                            0.757140   0.004182   0.761322 (  0.716131)
    map-reduce:                           4.970376   0.005551   4.975927 (  4.833328)


                                              user     system      total        real
send vs. lambda vs. method_missing
----------------------------------

    direct method call (def):             1.867254   0.005400   1.872654 (  1.776896)
    direct method call (define_method):   1.990171   0.002021   1.992192 (  1.981346)
    send (def, called with string):       4.651477   0.003413   4.654890 (  4.650353)
    send (def, called with symbol):       2.655781   0.001128   2.656909 (  2.652628)
    send (define_method, string):         4.724643   0.005592   4.730235 (  4.728050)
    send (define_method, symbol):         2.836217   0.005233   2.841450 (  2.840342)
    lambda:                               3.301982   0.008059   3.310041 (  3.316055)
    method_missing:                       4.406742   0.006569   4.413311 (  4.406633)
    instance_exec:                       10.361078   0.012670  10.373748 ( 10.311806)


