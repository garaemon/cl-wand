(defsystem cl-wand
  :depends-on (cffi chimi alexandria)
  :components
  ((:file "cl-wand")
   (:file "library" :depends-on ("cl-wand"))
   (:file "binding" :depends-on ("cl-wand" "library"))
   (:file "wand" :depends-on ("cl-wand" "binding"))
   (:file "image" :depends-on ("cl-wand" "binding" "wand"))
   )
  )
