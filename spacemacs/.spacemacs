;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
    (c-c++ :variables
           c-c++-default-mode-for-headers 'c++-mode
           python-enable-yapf-format-on-save t)
     go
     python
     markdown
     helm
     pandoc
     emacs-lisp
     git
     org
     common-lisp
     racket
     auto-completion
     ;;ipython-notebook
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; better-defaults
     ;;parinfer
   (shell :variables
          shell-default-shell 'shell
          shell-default-height 30
          shell-default-position 'bottom)
   ;; spell-checking
   ;; syntax-checking
   ;; version-control
   )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(solarized-theme dash s f ob-ipython)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer
configuration executes."

  (push "~/scimax/" load-path)
  (setenv "WORKON_HOME" "/usr/local/miniconda3/envs")
  (setq-default exec-path-from-shell-check-startup-files nil)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs
initialization after layers configuration."

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((ipython . t)
     (python . t)
     (shell . t)
     ))

  (setq-default fill-column 70
                org-confirm-babel-evaluate nil)
                                        ;
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

  (defun hotspots ()
  "helm interface to my hotspots, which includes my locations, org-files and bookmarks"
  (interactive)
  (helm :sources `(
                   ((name . "My Locations")
                    ;;(candidates . (;;("master" . "~/Dropbox/org-mode/master.org")
                                   ;;("references" . "~/Dropbox/bibliography/references.bib")
                                   ;;("notes" . "~/Dropbox/bibliography/notes.org")
                                   ;;("tasks" . "~/Dropbox/org-mode/tasks.org")))
                    (action . (("Open" . (lambda (x) (find-file x))))))

                   ((name . "My org files")
                    (candidates . ,(f-entries "~/Dropbox/org-mode"))
                    (action . (("Open" . (lambda (x) (find-file x))))))
                   helm-source-recentf
                   helm-source-bookmarks
                   helm-source-bookmark-set)))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help racket-mode faceup ob-ipython ein skewer-mode request-deferred websocket deferred js2-mode simple-httpd go-guru go-eldoc go-mode helm-company helm-c-yasnippet fuzzy company-statistics company-go company-c-headers common-lisp-snippets auto-yasnippet yasnippet ac-ispell auto-complete company-anaconda disaster cmake-mode clang-format powerline spinner parent-mode projectile pkg-info epl flx smartparens iedit anzu evil goto-chg eval-sexp-fu highlight bind-map bind-key packed helm helm-core popup undo-tree hydra f s async avy dash slime-company company slime smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download magit-gitflow htmlize helm-gitignore gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit ghub let-alist with-editor yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode anaconda-mode pythonic pandoc-mode ox-pandoc ht mmm-mode markdown-toc markdown-mode gh-md parinfer ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline solarized-theme restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clj-refactor clean-aindent-mode cider-eval-sexp-fu auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
