
;; http://ergoemacs.org/emacs/emacs_package_system.html
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;; follow symlinks by default
(setq vc-follow-symlinks)

;; various cool themes
;; (load-theme 'darcula t)
;; (load-theme 'clues t)
;; (load-theme 'mustang t)
(load-theme 'calmer-forest t)
;; (load-theme 'noctilux t)
;; (load-theme 'lush t)
;; (load-theme 'inkpot t)
;; (load-theme 'sunny-day t)
;; (load-theme 'zen-and-art t)
;; (load-theme 'soft-charcoal t)
;; (load-theme 'badwolf t)


;; https://github.com/Bruce-Connor/smart-mode-line
;; (setq sml/theme 'dark)
;; (sml/setup)

;; various bindings
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.feature\\'" . feature-mode))
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))

;; disable mode line
;; (setq-default mode-line-format nil)

;; disable menu bar
(menu-bar-mode -99)

;; javascript indent
(setq js-indent-level 2)

;; go indent
(defun my-go-mode-hook () 
  (add-hook 'before-save-hook 'gofmt-before-save) 
  (setq tab-width 4 indent-tabs-mode 0)) 
(add-hook 'go-mode-hook 'my-go-mode-hook) 

;; multi-web mode
(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

;; disable magit (git support) prompt / instructions
(setq magit-last-seen-setup-instructions "1.4.0")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" default)))
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
