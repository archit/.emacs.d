(load-theme 'solarized-dark t)
(add-to-list 'auto-mode-alist '("\\.js.coffee.erb$" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\..*hbs.*$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.podspec$" . ruby-mode))

(custom-set-variables
 '(exec-path (quote ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin" "/usr/local/bin")))
 '(ack-and-a-half-executable (let ((ack-grep-bin (executable-find "ack-grep"))
                                   (ack-bin (executable-find "ack")))
                               (if ack-grep-bin ack-grep-bin
                                 (if ack-bin ack-bin nil))))
 '(scss-compile-at-save nil)
 '(haskell-mode-hook '(turn-on-haskell-indent)))

;; binding.pry my test/method/function in ruby
(defun pry-me ()
  (interactive)
  (save-excursion
    (insert "binding.pry\n")
    (re-search-backward "should [\"'][^\"']*[\"'] do")
    (forward-char 8)
    (insert "pry ")))

(add-hook 'coffee-mode-hook '(lambda () (setq tab-width 2)))

(eval-after-load 'ruby-mode
  '(progn
     ;; stop the crazy indentation
     (setq ruby-deep-indent-paren-style nil)

     ;; always indent on newline
     (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)

     ;; add binding for pry-me
     (define-key ruby-mode-map (kbd "C-x p") 'pry-me)))

(global-set-key (kbd "C-x C-f") 'find-file-other-window)

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

;; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(server-start)
(rvm-use "ruby-2.0.0-p353" "")
