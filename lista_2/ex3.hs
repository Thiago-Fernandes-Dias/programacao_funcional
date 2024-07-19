f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f (x, y) (w, z) = ((y, z), (x, w))