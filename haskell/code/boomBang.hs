--for odd numbers less than 10, return boom, otherwise return bang
boomBang xs = [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]