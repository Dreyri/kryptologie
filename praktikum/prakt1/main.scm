(load "prakt1.scm")

(display "1.")
(newline)
(display-call-result '(ggt 282 240))
(display-call-result '(ggt (+ (expt 9 100) 1) (+ (expt 10 100) 1)))

(display "2.")
(newline)
(display-call-result '(ggt-count 282 240))
(display-call-result '(ggt-count (+ (expt 9 100) 1) (+ (expt 10 100) 1)))

(display "3.")
(newline)
(display-call-result '(exact->inexact (mittel (expt 10 100) 10000)))

(display "4.")
(newline)

(display "5.")
(newline)

(display-call-result '(cx=dmodm 25 13 61))
(display-call-result '(cx=dmodm 86 13 61))
(display-call-result '(cx=dmodm 19 14 61))
(display-call-result '(cx=dmodm 6 3 15))
(display-call-result '(cx=dmodm 6 3 18))
(display-call-result '(cx=dmodm (+ 1 (expt 9 100)) (+ 1 (expt 8 100)) (+ 1 (expt 10 100))))
