or1 False False = False
or1 True _ = True
or1 _ True = True

or2 False False = False
or2 True b2 = True
or2 b1 True = True

main = do
    print (or1 True False)
    print (or1 False True)
    print (or1 True True)
    print (or1 False False)
    print (or2 True False)
    print (or2 False True)
    print (or2 True True)
    print (or2 False False)
