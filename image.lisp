;;================================================
;; image.lisp
;;
;; written by R.Ueda (garaemon)
;;================================================

(in-package :cl-wand)

(defun magick-error ()
  nil)

(defun red-pixel (pixel)
  (let ((v (round (* 256 (PixelGetRed pixel)))))
    (if (>= v 256) 255 v)))
(defun green-pixel (pixel)
  (let ((v (round (* 256 (PixelGetGreen pixel)))))
    (if (>= v 256) 255 v)))
(defun blue-pixel (pixel)
  (let ((v (round (* 256 (PixelGetBlue pixel)))))
    (if (>= v 256) 255 v)))
        


(defun read-image (fname &optional result)
  (with-wand (wand)
    (let ((ret (MagickReadImage wand fname)))
      (if (magick-false-p ret)
          (magick-error)
          (let ((width (MagickGetImageWidth wand))
                (height (MagickGetImageHeight wand)))
            (declare (type fixnum width height))
            (let ((result (or result
                              (make-array `(,height ,width 3)
                                          :element-type
                                          '(unsigned-byte 8)))))
              (declare (type (simple-array (unsigned-byte 8)) result))
              (with-pixel-iterator (iterator wand)
                (cffi:with-foreign-objects
                    ((dummy :unsigned-long)
                     (pixel 'MagickPixelPacket))
                  (dotimes (i height)
                    (let ((pixels (PixelGetNextIteratorRow iterator dummy)))
                      (dotimes (j width)
                        (let ((target-pixel (mem-aref pixels :pointer j)))
                          (setf (aref result i j 0)
                                (red-pixel target-pixel))
                          (setf (aref result i j 1)
                                (green-pixel target-pixel))
                          (setf (aref result i j 2)
                                (blue-pixel target-pixel))))))))
              (the (simple-array (unsigned-byte 8)) result)))))))


