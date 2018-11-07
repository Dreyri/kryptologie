(use-modules (ice-9 local-eval))

;; Aufgabe 1
(define (ggt a b)
  (cond [(= b 0) a]
	[else (ggt b (modulo a b))]))

;; Aufgabe 2
(define (ggt-count a b)
  (letrec ((ggt-help
	    (lambda (a b count)
	      (cond [(= b 0) count]
		    [else (ggt-help b (modulo a b) (+ count 1))]))))
    (ggt-help a b 1)))

;; Aufgabe 3
(define (mittel n anz)
  (letrec ((mittel-sum
	    (lambda (a b cumsum i)
	      (cond [(= i anz) (/ cumsum anz)]
		    [else (mittel-sum (random n) (random n) (+ cumsum (ggt-count a b)) (+ i 1))]))))
    (mittel-sum (random n) (random n) 0 0)))

;; Aufgabe 4
(define (display-mittel-stellen stellen)
  (letrec ((display-mittel-n 
	    (lambda (n)
	      (cond [(> n stellen)]
		    [else
		     (display n) (display "; ")
		     (display (exact->inexact (mittel (expt 10 n) 1000))) (newline)
		     (display-mittel-n (+ n 1))]))))
    (display "1..") (display stellen) (newline)
    (display-mittel-n 1)))

(define (display-mittel-stellen1 stellen)
  (letrec ((display-mittel-n 
	    (lambda (n)
	      (cond [(> n stellen)]
		    [else
		     (display n) (display "; ")
		     (display (exact->inexact (mittel (expt 10 n) 1000))) (newline)
		     (display-mittel-n (+ n 1))]))))
    (display "1..") (display stellen) (newline)
    (display-mittel-n 1)))
;; Aufgabe 5

;(define (rkqkxk a b)
  ;(letrec ((r0 a)
	   ;(r1 b)
	   ;(x0 1)
	   ;(x1 0)
	   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;        (qnxn (lambda (r0 r1 x0 x1)					   ;;
    ;; 		 (let ((modr (modulo r0 r1))					   ;;
    ;; 		       (q2 (floor (/ r0 r1))))					   ;;
    ;; 		   (cond [(= modr 0) (r1 . x1)]					   ;;
    ;; 			 [else							   ;;
    ;; 			  (qnxn r1 modr q1 q2 x1 (- x0 (* x1 q2)))])))))	   ;;
    ;; (qnxn r0 r1 x0 x1)))							   ;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (extended-euclid a b)
  (letrec ((next-euclid
	    (lambda (r q x y)
	      (let ((rn (modulo (car (cdr r)) (car r))))
		(cond [(eq? rn 0) (list r q x y)]
		      [else (let* ((qn (quotient (car (cdr r)) (car r)))
				   (xn (- (car (cdr x)) (* (car x) qn)))
				   (yn (- (car (cdr y)) (* (car y) qn))))
			      (next-euclid (cons rn r) (cons qn q) (cons xn x) (cons yn y)))])))))
    (next-euclid (list b a) (list 0 0) (list 0 1) (list 1 0))))

(define (cx=dmodm c d m)
  (let ((euclid (extended-euclid c m)))
    (let ((gcd (car (car euclid)))
	  (x (car (list-ref euclid 2))))
      (cond
       [(not (= (modulo d gcd) 0)) -1]
       [else
	(modulo (* (/ d gcd) x) m)]))))

(define (display-call-result expr)
  (display "call: ")
  (display expr)
  (newline)
  (display "result: ")
  (display (local-eval expr (the-environment)))
  (newline))
  
