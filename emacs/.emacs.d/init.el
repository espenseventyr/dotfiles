
;; I use =cask= and =pallet= for managing packages. These need to be included in
;; here to ensure that the correct version of =org= is used to render my
;; =configuration.org= file.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(org-babel-load-file "~/.emacs.d/configuration.org")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (paredit geiser haskell-mode org-bullets evil-surround yasnippet web-mode use-package smex smartparens projectile prodigy powerline popwin pallet org nyan-mode multiple-cursors moe-theme matlab-mode magit key-chord idle-highlight-mode htmlize flycheck-cask expand-region exec-path-from-shell evil eval-in-repl ess drag-stuff))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
