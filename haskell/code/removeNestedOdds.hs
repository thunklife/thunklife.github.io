--The output of the list comprhension is another comprehension.
removeNestedOdds xs = [[ x | x <- xs, even x ] | xs <- xxs]