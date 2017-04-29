;;; python-pylint-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (python-pylint) "python-pylint" "python-pylint.el"
;;;;;;  (21896 51769))
;;; Generated autoloads from python-pylint.el

(autoload 'python-pylint "python-pylint" "\
Run PYLINT, and collect output in a buffer.
While pylint runs asynchronously, you can use \\[next-error] (M-x next-error),
or \\<python-pylint-mode-map>\\[compile-goto-error] in the grep output buffer, to go to the lines where pylint found matches.

\(fn)" t nil)

(defalias 'pylint 'python-pylint)

;;;***

;;;### (autoloads nil nil ("python-pylint-pkg.el") (21896 51769 25986))

;;;***

(provide 'python-pylint-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; python-pylint-autoloads.el ends here
