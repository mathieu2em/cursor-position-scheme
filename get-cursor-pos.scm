(define (get)
    (read-char (current-input-port)))

(define (cursor-absolute-position)
      (define (read-number stop-car)
	(let loop ((c (list (get))))
	  (if (not (char=? (car c) stop-car))
	      (begin
		(pp c)
		(loop (cons (get) c)))
	      (if (pair? c)
		      (string->number (list->string (reverse (cdr c))))
		      (string->number (string c))))))

      (write-string "\033[6n" tty)
      (get)
      (get)
      (cons (read-number #\;)
	    (read-number #\R)))
