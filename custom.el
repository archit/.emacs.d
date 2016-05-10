(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(exec-path (quote ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/local/bin"
                     "/Applications/Emacs.app/Contents/MacOS/bin")))
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
