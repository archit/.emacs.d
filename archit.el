(color-theme-twilight)
(add-to-list 'auto-mode-alist
             '("\\.js.coffee.erb$" . coffee-mode)
             '("\\.*hbs.*$" . html-mode))

(add-hook 'coffee-mode-hook '(lambda () (set (make-local-variable 'tab-width) 2)))

(add-hook 'coffee-mode-hook
          '(lambda () (set (make-local-variable 'tab-width) 2)))
