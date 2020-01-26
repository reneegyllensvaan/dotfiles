;; Define q-macros
(defun comma-line-split () (interactive)
  (call-process-region
    (region-beginning)
    (region-end)
    "/usr/bin/env" t t nil
    "tr"
    "' '"
    "'\n'"))
