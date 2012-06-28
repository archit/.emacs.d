(color-theme-twilight)
(add-to-list 'auto-mode-alist
             '("\\.js.coffee.erb$" . coffee-mode)
             '("\\.*hbs.*$" . html-mode))

(add-hook 'coffee-mode-hook '(lambda () (set (make-local-variable 'tab-width) 2)))

(add-hook 'coffee-mode-hook
          '(lambda () (set (make-local-variable 'tab-width) 2)))

(global-set-key (kbd "M-t") 'ack-and-a-half)

; Override default find-file to find-file-in-other-window
(global-set-key (kbd "C-x C-f") 'find-file-other-window)
; Override default kill-buffer binding
(global-set-key (kbd "C-x k") 'kill-buffer)

; Find-file-in-project customizations
(require 'find-file-in-project)
(global-set-key (kbd "C-x 4 f") 'find-file-in-project)
(setq ffip-patterns (append '("*.sass" "*.coffee") ffip-patterns))

(require 'ruby-tools)
