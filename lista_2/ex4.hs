palindrome :: Eq a => [a] -> Bool
palindrome xs = xs == reverse xs

main = do
    print (palindrome "ANA")
    print (palindrome [1, 2, 1])