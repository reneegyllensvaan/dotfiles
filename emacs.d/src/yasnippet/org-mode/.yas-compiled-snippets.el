;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
		     '(("GRAPHVIZ" "#+BEGIN_SRC dot :file $1 :results graphics\ndigraph G {\n    $2 -> $3;\n}\n#+END_SRC\n#+RESULTS:" "Graphviz code block" nil nil nil "/Users/renee/.emacs.d/src/yasnippet/org-mode/Graphviz code block" nil nil)
		       ("```" "#+BEGIN_SRC $1\n  $0\n#+END_SRC" "Code block" nil nil nil "/Users/renee/.emacs.d/src/yasnippet/org-mode/Code" nil nil)))


;;; Do not edit! File generated at Wed Apr 17 12:56:48 2019
