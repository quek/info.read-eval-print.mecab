;;;; info.read-eval-print.mecab.asd

(asdf:defsystem #:info.read-eval-print.mecab
  :licence "public domain"
  :serial t
  :components ((:file "package")
               (:file "mecab-ffi")
               (:file "mecab"))
  :depends-on (#:cffi #:split-sequence))
