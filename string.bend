String.from_num n = (String.from_num_ n String/Nil)
String.from_num_ 0 r = r
String.from_num_ n r = (String.from_num_ (/ n 10) (String/Cons (+ 48 (% n 10)) r))

main = (String.from_num 300234)
