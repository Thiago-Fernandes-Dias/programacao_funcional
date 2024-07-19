dotProduct :: Num a => [a] -> [a] -> a
dotProduct x1 x2 
    | length x1 /= length x2 = error "Os vetores precisam ter o mesmo tamanho"
    | otherwise = foldr (\cp ac -> ac + uncurry (*) cp) 0 (zip x1 x2)

main = do
    print (dotProduct [1, 2, 3] [1, 2, 3])

