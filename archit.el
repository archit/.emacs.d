(load-theme 'solarized-dark t)
(add-to-list 'auto-mode-alist '("\\.js.coffee.erb$" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.podspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\..*hbs.*$" . handlebars-mode))
(add-to-list 'auto-mode-alist '("\\.handlebars.*$" . handlebars-mode))

(custom-set-variables
 '(exec-path (quote ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin" "/usr/local/bin")))
 '(ack-and-a-half-executable (let ((ack-grep-bin (executable-find "ack-grep"))
                                   (ack-bin (executable-find "ack")))
                               (if ack-grep-bin ack-grep-bin
                                 (if ack-bin ack-bin nil))))
 '(scss-compile-at-save nil)
 '(haskell-mode-hook '(turn-on-haskell-indent))
 '(coffee-tab-width 2)
 '(js-indent-level 4)
 '(fill-column 300))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(enh-ruby-string-delimiter-face ((t (:foreground "gray55"))))
 '(enh-ruby-op-face ((t (:foreground "gray55")))))

(eval-after-load 'ruby-mode
  '(progn
     ;; stop the crazy indentation
     (setq ruby-deep-indent-paren-style nil)

     ;; always indent on newline
     (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)))

(global-set-key (kbd "C-x C-f") 'find-file-other-window)

;; make Cmd key act as Meta
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
(setq mac-control-modifier 'control)
(setq ns-function-modifier 'hyper)

(require 'ruby-tools)
(require 'rvm)

(setq visible-bell nil) ;; The default
(setq ring-bell-function 'ignore)

(server-start)
