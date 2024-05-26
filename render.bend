
type IO_T
  = (Done magic expr)
  | (Call magic func argm cont)

IO_T/MAGIC = (0xD0CA11, 0xFF1FF1)

IO_T/wrap x = (IO_T/Done IO_T/MAGIC x)

IO_T/bind a b = match a {
  IO_T/Done: (b a.expr)
  IO_T/Call: (IO_T/Call IO_T/MAGIC a.func a.argm @x (IO_T/bind (a.cont x) b))
}

call_io func argm = (IO_T/Call IO_T/MAGIC func argm @x (IO_T/Done IO_T/MAGIC x))

sqr x = (* x x)

pow2 0 = 1
pow2 n = (* (pow2 (- n 1)) 2)

pow2f 0 = 1.0
pow2f n = (* (pow2f (- n 1)) 2.0)

render n y =
  let p = (/ 1.0 (pow2f n))
  (render_ n 1.0 (+ -1.0 p) y "\n")
render_ 0 * x y s = let c = (shader x y)
  (String/Cons c (String/Cons c s))
render_ n h x y s =
  let h2 = (* h 0.5)
  let r = (render_ (- n 1) h2 (+ x h) y s)
  let l = (render_ (- n 1) h2 x y r)
  l

render2 n =
  let p = (/ 1.0 (pow2f n))
  (render2_ n (pow2 n) (- 1.0 p) (* 2.0 p))
render2_ * 0 * * = *
render2_ n j y dy = do IO_T {
  let j = (- j 1)
  ask * = (call_io "PUT_TEXT" (render n y))
  (render2_ n j (- y dy) dy)
}

Main n = (render2 n)

len s = (len_ s 0.0)
len_ String/Nil l = l
len_ (String/Cons * s) l = (len_ s (+ l 1.0))

symbols = ".,:;=%$@"
symbols_len = (len symbols)
symb n = (symb_ (* n symbols_len) symbols)
symb_ * String/Nil = ' '
symb_ n (String/Cons c l) =
  if (< n 1.0) {
    c
  } else {
    (symb_ (- n 1.0) l)
  }

shader x y =
  let v = (+ (sqr x) (sqr y))
  (symb v)