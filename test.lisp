(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :info.read-eval-print.mecab))

(defpackage :mecab-test
  (:use :cl :info.read-eval-print.mecab))

(in-package :mecab-test)

(assert (equalp
         '(#("太郎" 名詞 固有名詞 人名 名 NIL NIL "太郎" "タロウ" "タロー")
           #("は" 助詞 係助詞 NIL NIL NIL NIL "は" "ハ" "ワ")
           #("次郎" 名詞 固有名詞 人名 名 NIL NIL "次郎" "ジロウ" "ジロー")
           #("が" 助詞 格助詞 一般 NIL NIL NIL "が" "ガ" "ガ")
           #("持っ" 動詞 自立 NIL NIL 五段・タ行 連用タ接続 "持つ" "モッ" "モッ")
           #("て" 助詞 接続助詞 NIL NIL NIL NIL "て" "テ" "テ")
           #("いる" 動詞 非自立 NIL NIL 一段 基本形 "いる" "イル" "イル")
           #("本" 名詞 一般 NIL NIL NIL NIL "本" "ホン" "ホン")
           #("を" 助詞 格助詞 一般 NIL NIL NIL "を" "ヲ" "ヲ")
           #("花" 名詞 一般 NIL NIL NIL NIL "花" "ハナ" "ハナ")
           #("子" 名詞 接尾 一般 NIL NIL NIL "子" "コ" "コ")
           #("に" 助詞 格助詞 一般 NIL NIL NIL "に" "ニ" "ニ")
           #("渡し" 動詞 自立 NIL NIL 五段・サ行 連用形 "渡す" "ワタシ" "ワタシ")
           #("た" 助動詞 NIL NIL NIL 特殊・タ 基本形 "た" "タ" "タ")
           #("。" 記号 句点 NIL NIL NIL NIL "。" "。" "。"))
         (mecab "太郎は次郎が持っている本を花子に渡した。")))

(assert (string= "次郎"
                 (node-表層形 (third (mecab "太郎は次郎が持っている本を花子に渡した。")))))
