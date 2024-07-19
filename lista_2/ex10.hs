co :: (b -> c) -> (a -> b) -> a -> c
co f g = \x -> f (g x)

main = do
    print (co (+2) (+2) 1)