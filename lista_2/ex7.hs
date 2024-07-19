and2 :: Bool -> Bool -> Bool
and2 b1 b2 = if b1 then if b2 then True else False else False

main = do
    print ( and2 True True == True )
    print ( and2 False True == False )
    print ( and2 True False == False )
    print ( and2 False False == False )