type Int
	= (T ~n)
	| (O ~n)
	| (I ~n)
	| E

to_int (Int/T n) = (- (* +3 (to_int n)) +1)
to_int (Int/O n) = (* +3 (to_int n))
to_int (Int/I n) = (+ (* +3 (to_int n)) +1)
to_int Int/E = +0

from_int i = (from_int_ (/ i +3) (% i +3))
from_int_ 0 0 = Int/E
from_int_ d 0 = (Int/O (from_int_ (/ d +3) (% d +3)))
from_int_ d 1 = (Int/I (from_int_ (/ d +3) (% d +3)))
from_int_ d _ = let d = (+ d 1); (Int/T (from_int_ (/ d +3) (% d +3)))

inc (Int/T n) = (Int/O n)
inc (Int/O n) = (Int/I n)
inc (Int/I n) = (Int/T (inc n))
inc Int/E = Int/E

dec (Int/T n) = (Int/I (dec n))
dec (Int/O n) = (Int/T n)
dec (Int/I n) = (Int/O n)
dec Int/E = Int/E

neg (Int/T n) = (Int/I (neg n))
neg (Int/O n) = (Int/O (neg n))
neg (Int/I n) = (Int/T (neg n))
neg Int/E = Int/E

#main = (to_int (inc (from_int +12)))
#main = (to_int (dec (from_int +12)))
main = (to_int (neg (from_int +12)))
#main = (from_int +5)
#main = (to_int (Int/I (Int/T Int/E)))
