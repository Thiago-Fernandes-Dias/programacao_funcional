penultimo :: [a] -> a
penultimo [] = error "Lista vazia"
penultimo [_] = error "Lista com apenas um elemento"
penultimo (_:xs) = head (drop (length xs - 3) xs)

main = do
    print (penultimo [1, 2, 3])
    print (penultimo ([] :: [Integer]))
    print (penultimo [1])
    print (penultimo [1..10])