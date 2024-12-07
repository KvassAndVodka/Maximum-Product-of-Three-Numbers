;; Load the split-sequence package to split the input string
(require 'split-sequence)

(defun read-integers (prompt size)
  "Reads SIZE integers from the user with a PROMPT."
  (format t "~a~%" prompt)
  (let ((input (read-line)))
    (loop for s in (split-sequence:split-sequence #\Space input)
          collect (parse-integer s))))

(defun calculate-maximum-product (nums)
  "Calculates the maximum product of three numbers in NUMS."
  (let ((min1 most-positive-fixnum)
        (min2 most-positive-fixnum)
        (max1 most-negative-fixnum)
        (max2 most-negative-fixnum)
        (max3 most-negative-fixnum))
    ;; Loop through the array to find the necessary values
    (dolist (n nums)
      ;; Update the largest three values
      (when (> n max3)
        (setf max3 (max max2 n))
        (when (> max3 max2)
          (rotatef max3 max2))
        (when (> max2 max1)
          (rotatef max2 max1)))

      ;; Update the smallest two values
      (when (< n min2)
        (setf min2 (min min1 n))
        (when (< min2 min1)
          (rotatef min2 min1))))
    ;; Return the maximum product
    (max (* max1 max2 max3)
         (* max1 min1 min2))))

(defun main ()
  "Main function to handle user input and calculate the result."
  (format t "Enter the size of the array: ")
  (let ((size (parse-integer (read-line))))
    (if (< size 3)
        (format t "Array size must be at least 3.~%")
        (let ((nums (read-integers "Enter the elements of the array:" size)))
          (format t "Maximum product of three numbers is: ~a~%" 
                  (calculate-maximum-product nums))))))

;; Call the main function
(main)
