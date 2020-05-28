;; #####################################################################
;; ### Author: Caleb McCaffery <irishmac473@icloud.com>              ###
;; ### File: init-completion.el                                      ###
;; #####################################################################
;; ### Provides the packages and config for completion frameworks    ###
;; #####################################################################

;; Company is a pluggable text completion framework for Emacs.

(use-package company
  :ensure t
  :config
  (progn (global-company-mode 1)
         (setq company-idle-delay 0.1)
         (setq company-show-numbers t)))

(use-package smartparens
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'smartparens-mode))

(provide 'init-completion)
