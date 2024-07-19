and3 :: Bool -> Bool -> Bool
and3 b1 b2 = if b1 then b2 else False

main = do
    print ( and3 True True == True )
    print ( and3 False True == False )
    print ( and3 True False == False )
    print ( and3 False False == False )