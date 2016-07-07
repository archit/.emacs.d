;;; init.el --- Where all the magic begins
;;
;; Adapted from the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;
;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"

;; Turn off mouse interface early in startup to avoid momentary display
;; You really don't need these; trust me.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Load path etc.

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; Load up ELPA, the package manager

(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit"))
(add-to-list 'load-path (concat dotfiles-dir "/lisp"))
(add-to-list 'load-path (concat dotfiles-dir "/starter-kit"))

(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq custom-file (concat dotfiles-dir "custom.el"))

(require 'package)
(dolist (source '(("melpa" . "http://melpa.milkbox.net/packages/")))
  (add-to-list 'package-archives source t))
(package-initialize)
(require 'starter-kit-elpa)

;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session

(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

;; Load up starter kit customizations

(require 'starter-kit-defuns)
(require 'starter-kit-bindings)
(require 'starter-kit-misc)
(require 'starter-kit-registers)
(require 'starter-kit-eshell)
(require 'starter-kit-lisp)
(require 'starter-kit-perl)
(require 'starter-kit-ruby)
(require 'starter-kit-js)

(require 'ruby-tools)
(require 'rvm)

(regen-autoloads)
(load custom-file 'noerror)

; default window width and height
(defun custom-set-frame-size ()
  (add-to-list 'default-frame-alist '(height . 45))
  (add-to-list 'default-frame-alist '(width . 161)))
(custom-set-frame-size)
(add-hook 'before-make-frame-hook 'custom-set-frame-size)

(load-theme 'solarized-dark t)
(add-to-list 'auto-mode-alist '("\\.js.coffee.erb$" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.podspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\..*hbs.*$" . handlebars-mode))
(add-to-list 'auto-mode-alist '("\\.handlebars.*$" . handlebars-mode))

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

(setq visible-bell nil) ;; The default
(setq ring-bell-function 'ignore)

(server-start)
;;; init.el ends here
