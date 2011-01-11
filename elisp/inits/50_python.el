;; 50_python.el
;; 2011/01/01 作成
;; python 用設定

(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode) interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)

;; http://d.hatena.ne.jp/bellbind/20100723/1279905842
(add-hook 'python-mode-hook
          '(lambda()
             (defun my-indent-line (&optional arg)
               "modeless indent for python indentation"
               (interactive "P")
               (let ((old-this-command this-command))
                 (setq this-command t)
                 (py-indent-line arg)
                 (setq this-command old-this-command)
                 ))
             (setq indent-line-function 'my-indent-line)
             ))
