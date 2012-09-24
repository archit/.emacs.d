(color-theme-twilight)
(setq auto-mode-alist
      (append '(("\\.js.coffee.erb$" . coffee-mode) ("\\..*hbs.*$" . html-mode))
              auto-mode-alist))

(custom-set-variables
 '(exec-path (quote ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin" "/usr/local/bin")))
 '(ack-and-a-half-executable (let ((ack-grep-bin (executable-find "ack-grep")) (ack-bin (executable-find "ack"))) (if ack-grep-bin ack-grep-bin (if ack-bin ack-bin nil)))))

(add-hook 'coffee-mode-hook '(lambda () (setq tab-width 2)))

; binding.pry my test/method/function in ruby
(defun pry-me ()
  (interactive)
  (save-excursion
    (insert "binding.pry\n")
    (re-search-backward "should [\"'][^\"']*[\"'] do")
    (forward-char 8)
    (insert "pry ")))

(eval-after-load 'ruby-mode
  '(progn
     ;; stop the crazy indentation
     (setq ruby-deep-indent-paren-style nil)

     ;; always indent on newline
     (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)

     ;; add binding for pry-me
     (define-key ruby-mode-map (kbd "C-x p") 'pry-me)))

(global-set-key (kbd "C-x C-f") 'find-file-other-window)
(global-set-key (kbd "C-x C-t") 'ack-and-a-half)

;; make Cmd key act as Meta
(setq ns-command-modifier 'meta)

; Find-file-in-project customizations
(require 'find-file-in-project)
(global-set-key (kbd "C-x 4 f") 'find-file-in-project)
(setq ffip-patterns (append '("*.sass" "*.coffee") ffip-patterns))

(require 'ruby-tools)
(require 'rvm)
(require 'package)
(package-initialize)
(server-start)
