--find a right triangle
--all sides are integers
--all sides less than 10
--perimeter is 24
triples = [(a,b,c) | c <- [1..10], a <- [1..c], b <-[1..a], (a^2 + b^2 == c^2), (a+b+c == 24)]
