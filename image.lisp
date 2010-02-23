;;================================================
;; image.lisp
;;
;; written by R.Ueda (garaemon)
;;================================================

(in-package :cl-wand)

(defun magick-error ()
  (error "error has occurred in magickwand"))

(defun red-pixel (pixel)
  (let ((v (round (* 256 (PixelGetRed pixel)))))
    (if (>= v 256) 255 v)))
(defun (setf red-pixel) (v pixel)
  (PixelSetRed pixel (/ v 256.d0)))
  
(defun green-pixel (pixel)
  (let ((v (round (* 256 (PixelGetGreen pixel)))))
    (if (>= v 256) 255 v)))
(defun (setf green-pixel) (v pixel)
  (PixelSetGreen pixel (/ v 256.d0)))

(defun blue-pixel (pixel)
  (let ((v (round (* 256 (PixelGetBlue pixel)))))
    (if (>= v 256) 255 v)))
(defun (setf blue-pixel) (v pixel)
  (PixelSetBlue pixel (/ v 256.d0)))

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

(defun write-image (image-array fname)
  "image-array is #3A array."
  (with-wand (wand)
    (let ((width (array-dimension image-array 1))
          (height (array-dimension image-array 0)))
      (let ((background (NewPixelWand)))
        (let ((ret (MagickNewImage wand width height background)))
          (if (magick-false-p ret)
              (magick-error)))
        (DestroyPixelWand background))
      (with-pixel-iterator (iterator wand)
        (cffi:with-foreign-objects
            ((dummy :unsigned-long)
             (pixel 'MagickPixelPacket))
          (dotimes (i height)
            (let ((pixels (PixelGetNextIteratorRow iterator dummy)))
              (dotimes (j width)
                (let ((target-pixel (mem-aref pixels :pointer j)))
                  (setf (red-pixel target-pixel) (aref image-array i j 0))
                  (setf (green-pixel target-pixel) (aref image-array i j 1))
                  (setf (blue-pixel target-pixel) (aref image-array i j 2))))
              ;;(PixelSetIteratorRow iterator i)
              (PixelSyncIterator iterator)
              ))
          ))
      (not (magick-false-p (MagickWriteImage wand fname))))))

