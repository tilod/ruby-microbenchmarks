Rubinius 2.0.0-rc1 -- Intel Core i5 @1.7 GHz
============================================


                                              user     system      total        real
array include vs. boolean or
----------------------------

    boolean or (4 parts):                 0.617766   0.004470   0.622236 (  0.602198)
    boolean or (10 parts):                0.712131   0.001143   0.713274 (  0.694534)
    boolean or (25 parts):                1.048182   0.002785   1.050967 (  1.005240)
    array.include? (4 parts):             2.298708   0.003643   2.302351 (  2.261316)
    array.include? (10 parts):            4.088345   0.004050   4.092395 (  4.057457)
    array.include? (25 parts):            7.769642   0.008068   7.777710 (  7.749546)


                                              user     system      total        real
Hash: direct assignment vs. merge
---------------------------------

    direct assignment (1000x1):           1.287914   0.007388   1.295302 (  0.926534)
    merge! (1000x1):                      3.388148   0.010780   3.398928 (  3.229367)
    merge (1000x1):                     166.410982   0.161432 166.572414 (166.292309)
    direct assignment (100x10):           0.838924   0.001662   0.840586 (  0.749690)
    merge! (100x10):                      0.656680   0.000236   0.656916 (  0.632433)
    merge (100x10):                      16.328489   0.008304  16.336793 ( 16.331290)
    direct assignment (10x100):           0.812940   0.000542   0.813482 (  0.763662)
    merge! (10x100):                      0.592019   0.000134   0.592153 (  0.592010)
    merge (10x100):                       2.034349   0.000757   2.035106 (  2.034865)


                                              user     system      total        real
iterative vs. inject
--------------------

    iterative:                            0.971514   0.003458   0.974972 (  0.956998)
    inject (with block):                  3.432317   0.003548   3.435865 (  3.424334)
    inject (&:+):                         5.556268   0.004782   5.561050 (  5.504623)


                                              user     system      total        real
iterative vs. map
-----------------

    iterative:                            2.248806   0.006784   2.255590 (  2.151487)
    map:                                  3.532857   0.004078   3.536935 (  3.362754)


                                              user     system      total        real
iterative vs. map-reduce
------------------------

    iterative:                            0.702415   0.002829   0.705244 (  0.667822)
    map-reduce:                           4.690019   0.006997   4.697016 (  4.558402)


                                              user     system      total        real
send vs. lambda vs. method_missing
----------------------------------

    direct method call (def):             2.141754   0.006060   2.147814 (  2.039740)
    direct method call (define_method):   1.907440   0.001054   1.908494 (  1.899696)
    send (def):                           4.474705   0.003204   4.477909 (  4.473003)
    send (define_method):                 4.407637   0.002432   4.410069 (  4.403162)
    lambda:                               2.235117   0.000436   2.235553 (  2.225361)
    method_missing:                       3.920697   0.001669   3.922366 (  3.909822)
