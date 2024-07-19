pairs :: [a] -> [(a,a)]
pairs xs = zip xs (tail xs)

triples :: [a] -> [((a, a), a)]
triples xs = zip (zip xs (tail xs)) (tail (tail xs))

first :: ((a, b1), b2) -> a
first ((a, b), c) = a

second :: ((a, b1), b2) -> b1
second ((a, b), c) = b

third :: ((a, b1), b2) -> b2
third ((a, b), c) = c

localMaximum :: [Int] -> [Int]
localMaximum [] = []
localMaximum [_, _] = []
localMaximum xs = [second x | x <- ts, second x > first x, second x > third x]
    where 
        ts = triples xs

main = do
    print (localMaximum [1, 3, 4, 2, 5])
    print (localMaximum [1, 3, 2, 4, 1])

