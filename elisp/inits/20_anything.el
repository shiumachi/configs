;; anything.el
(require 'anything-startup)
(add-to-list 'anything-sources 'anything-c-source-emacs-commands)

;;(global-set-key (kbd "C-;") 'anything-filelist+)
(setq anything-c-filelist-file-name "/tmp/all.filelist")

;; troter 式
;; https://bitbucket.org/troter/home/src/a9a3b65a361e/.emacs.d/initialize/keybinding.el
;;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

;; (@* "anything")
(defun-eval-after-load 'anything
  ;;(global-set-key [(control x) (k)] 'anything-kill-buffers) ; kill-buffers
  ;;(global-set-key [(control x) (b)] 'anything-for-buffers)    ; switch-to-buffer
  ;;(global-set-key [(control x) (control f)] 'anything-filelist+)    ;find-fine
  (global-set-key [(control x) (b)] 'anything-filelist+)    ; switch-to-buffer
  (global-set-key [(meta y)] 'anything-show-kill-ring)        ; yank-pop
  (global-set-key [(meta %)] 'anything-regexp)  ; query-replace-regexp
  ;; C-x a prefix
  (defun-eval-after-load 'anything-complete
    (global-set-key [(control x) (a) (a)] 'anything-apropos))
  (global-set-key [(control x) (a) (r)] 'anything-regexp)
  (global-set-key [(control x) (a) (m)] 'anything-mark-ring)
  (global-set-key [(control x) (a) (M)] 'anything-global-mark-ring)
  (defun-eval-after-load 'descbinds-anything
    (global-set-key [(control x) (a) (d)] 'descbinds-anything))
)

(defun-eval-after-load 'anything-c-moccur
  (global-set-key [(meta o)] 'anything-c-moccur-occur-by-moccur) ; buffer
  (global-set-key [(control meta o)] 'anything-c-moccur-dmoccur) ; directory
)

(defun-eval-after-load 'key-chord
  ;; keybind
)
;; (@* "one key")
(defun-eval-after-load 'one-key
  (global-set-key [(control x) (v)] 'one-key-menu-VC))

;; (@* "others")
(defun-eval-after-load 'flymake
  (global-set-key [(control c) (d)] 'flymake-display-err-menu-for-current-line))

(defun-eval-after-load 'anything-rurima
  (global-set-key [(control c) (r)] 'anything-rurima)
  (global-set-key [(control c) (control r)] 'anything-rurima-at-point))

(defun-eval-after-load 'popwin
  (global-set-key [(control x) (control p)] popwin:keymap))

;(global-set-key "\C-z" 'undo)                       ;;UNDO
(global-set-key [f1] 'one-key-menu-help)

;; window switch
(global-set-key [(meta \[)] (lambda () (interactive) (other-window -1)))
(global-set-key [(meta \])] (lambda () (interactive) (other-window 1)))

(global-set-key [(control x) (control r)] 'reopen-file)
(global-set-key [(control x) (J)] 'open-junk-file)

;; open
(when (functionp 'cygstart)
  (global-set-key [(control c) (control f)] 'cygstart))
