;; #####################################################################
;; ### Author: Caleb McCaffery <irishmac473@icloud.com>              ###
;; ### File: init-treemacs.el                                        ###
;; #####################################################################
;; ### Provides Treemacs and other helper packages                   ###
;; #####################################################################

;; Treemacs, Sidebar navigation with extras.
;; Treemacs-projectile, Unifies projectile and treemacs.
;; Treemacs-magit, make treemacs show different colors for committed, staged
;; and modified files.

(use-package treemacs
  :ensure t  
  :config
  (treemacs-filewatch-mode t)
  (treemacs-git-mode 'extended)
  (treemacs-follow-mode -1)
  (add-hook 'treemacs-mode-hook (lambda() (display-line-numbers-mode -1))))

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(provide 'init-treemacs)
