(defsystem cl-wand
  :depends-on (cffi chimi alexandria)
  :components
  ((:file "cl-wand")
   (:file "library" :depends-on ("cl-wand")))
  )
