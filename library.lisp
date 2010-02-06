;;================================================
;; library.lisp
;;
;; written by R.Ueda (garaemon)
;;================================================

(in-package :cl-wand)

(define-foreign-library libwand
  (:linux "libMagickWand.so")
  (t "libMagickWand"))

(use-foreign-library libwand)


