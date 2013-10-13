doubleMe x = x + x
doubleUs x y =  doubleMe x + doubleMe y
doubleSmaller x = if x > 100
                    then x
                    else x*2
doubleSmaller' x = (if x > 100 then x else x*2) + 1