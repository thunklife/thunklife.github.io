fizzBuzz :: [Integer] -> [String]
fizzBuzz xs = [
                if mod x 15 == 0
                then "FIZZBUZZ"
                else
                    if mos x 3 == 0
                    then "FIZZ"
                    else
                        if mod x 5 == 0
                        then "BUZZ"
                        else show x
                | x <- xs]