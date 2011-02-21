%module mecab_ffi

#undef SWIG

%insert("lisphead") %{
(cl:in-package #:info.read-eval-print.mecab)

(cffi:define-foreign-library libmecab
  (:unix "libmecab.so"))

(cffi:use-foreign-library libmecab)
%}

%include "/usr/include/mecab.h"
