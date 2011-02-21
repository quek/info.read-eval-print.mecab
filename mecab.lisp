(in-package #:info.read-eval-print.mecab)

(defstruct (node (:type vector))
  表層形 品詞 品詞細分類1 品詞細分類2 品詞細分類3 活用形 活用型 原形 読み 発音)

(defmacro with-mecab ((mecab &optional (arg "")) &body body)
  `(let ((,mecab (mecab_new2 ,arg)))
     (unwind-protect
          (progn
            ,@body)
       (mecab_destroy mecab))))

(defun to-symbol (str)
  (if (string= "*" str)
      nil
      (intern str)))

(defun mecab (string)
  (with-mecab (mecab "")
    (let ((str (mecab_sparse_tostr mecab string)))
      (loop for line in (split-sequence:split-sequence #\Newline str )
            for (表層形 . rest) = (split-sequence:split-sequence #\Tab line)
            while rest
            for (品詞 品詞細分類1 品詞細分類2 品詞細分類3 活用形 活用型 原形 読み 発音)
              = (split-sequence:split-sequence #\, (car rest))
            collect (vector 表層形
                            (to-symbol 品詞)
                            (to-symbol 品詞細分類1)
                            (to-symbol 品詞細分類2)
                            (to-symbol 品詞細分類3)
                            (to-symbol 活用形)
                            (to-symbol 活用型)
                            原形 読み 発音)))))
