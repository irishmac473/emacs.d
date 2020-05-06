;; #####################################################################
;; ### Author: Caleb McCaffery <irishmac473@icloud.com>              ###
;; ### File: init-dashboard.el                                       ###
;; #####################################################################
;; ### Provides the Dashboard package                                ###
;; #####################################################################


;; required by Dashboard
(use-package page-break-lines
  :ensure t)

;; An extensible emacs startup screen showing you what’s most important.
(use-package dashboard
  :ensure t
  :diminish dashboard-mode
  :config
  (setq dashboard-banner-logo-title "Get Shit Done")
  (setq dashboard-startup-banner "~/.emacs.d/emacs-sexy.png")
  (setq dashboard-items '((recents  . 10)
                          (bookmarks . 10)))
  (dashboard-setup-startup-hook))


(provide 'init-dashboard)
