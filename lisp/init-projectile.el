;; #####################################################################
;; ### Author: Caleb McCaffery <irishmac473@icloud.com>              ###
;; ### File: init-projectile.el                                      ###
;; #####################################################################
;; ### Provides Projectile package                                   ###
;; #####################################################################

;; Projectile, a project interaction library for Emacs.

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-completion-system 'ivy)
  (projectile-mode +1))

(provide 'init-projectile)
