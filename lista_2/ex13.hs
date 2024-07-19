factorials :: Int -> [Int]
factorials 0 = []
factorials 1 = []
factorials n = [x | x <- [1 .. n - 1], n `mod` x == 0]

perfect :: Int -> Bool
perfect n = sum (factorials n) == n

perfects ns = [x | x <- ns, perfect x]

main = do
  print (perfects [1 .. 9000])