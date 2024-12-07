(defun maximum-product (nums)
  (let ((min1 most-positive-fixnum)
        (min2 most-positive-fixnum)
        (max1 most-negative-fixnum)
        (max2 most-negative-fixnum)
        (max3 most-negative-fixnum))
    (dolist (n nums)
      ;; Update the largest three values
      (cond
       ((> n max3)
        (if (> n max2)
            (progn
              (setf max3 max2)
              (if (> n max1)
                  (progn
                    (setf max2 max1)
                    (setf max1 n))
                  (setf max2 n)))
            (setf max3 n))))

      ;; Update the smallest two values
      (cond
       ((< n min2)
        (if (< n min1)
            (progn
              (setf min2 min1)
              (setf min1 n))
            (setf min2 n)))))

    (max (* max1 max2 max3) (* max1 min1 min2))))

(defun main ()
  (let ((nums '(1 10 -5 1 -100)))
    (format t "Maximum product: ~A~%" (maximum-product nums))))

(main)
