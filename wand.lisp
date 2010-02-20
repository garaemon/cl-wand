;;================================================
;; wand.lisp
;;
;; written by R.Ueda (garaemon)
;;================================================

(in-package :cl-wand)

(defun magick-false-p (val)
  (eq (cffi:translate-from-foreign val 'MagickBooleanType) :magickfalse))

(defmacro with-wand ((sym) &rest args)
  `(progn
     (MagickWandGenesis)
     (unwind-protect
          (let ((,sym (NewMagickWand)))
            (unwind-protect
                 (progn ,@args)
              (DestroyMagickWand ,sym)))
       (MagickWandTerminus))))

(defmacro with-pixel-iterator ((sym wand) &rest args)
  `(let ((,sym (NewPixelIterator ,wand)))
     (unwind-protect
          (progn ,@args)
       (DestroyPixelIterator ,sym))))
