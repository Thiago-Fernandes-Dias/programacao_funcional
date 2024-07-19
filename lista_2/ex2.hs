main = do
    print ( (* 9) 6 == 54)
    print ( head [(0, "doge"), (1, "kitteh")] == (0, "doge") )
    print ( head [(0 :: Integer, "doge"), (1, "kitteh")] == (0 :: Integer, "doge"))
    print ( if False then True else False == False)
    print ( length [1, 2, 3, 4, 5] == 5)
    print ( (length [1, 2, 3, 4] > length "TACOCAT") == False)
