;; #####################################################################
;; ### Author: Caleb McCaffery <irishmac473@icloud.com>              ###
;; ### File: init-shell.el                                           ###
;; #####################################################################
;; ### Provides packages and configs for shell usuage                ###
;; #####################################################################

(use-package vterm
  :ensure t
  :config
  (setq vterm-kill-buffer-on-exit t))


(provide 'init-shell)
