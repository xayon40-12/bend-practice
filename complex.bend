type Complex = (C x y)

c x y = (Complex/C x y)
x (Complex/C x y) = x
y (Complex/C x y) = y
zero = (c 0.0 0.0)

add (Complex/C x1 y1) (Complex/C x2 y2) = (Complex/C (+ x1 x2) (+ y1 y2))
sub (Complex/C x1 y1) (Complex/C x2 y2) = (Complex/C (- x1 x2) (- y1 y2))
mul (Complex/C x1 y1) (Complex/C x2 y2) = (Complex/C (- (* x1 x2) (* y1 y2)) (+ (* x1 y2) (* x2 y1)))
norm_sqr (Complex/C x y) = (+ (* x x) (* y y))
to_tuple (Complex/C x y) = (x, y)

Main =
  let a = (c 1.0 2.0)
  let b = (c 3.0 4.0)
  let z = (add a b)
  (to_tuple z)
