factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial(n-1)

quickSort :: Ord a => [a] -> [a]
quickSort []     = []
quickSort (x:xs) = quickSort [y | y <- xs, y <= x]
                   ++ [x] ++
                   quickSort [y | y <- xs, y > x]
 