;; #####################################################################
;; ### Author: Caleb McCaffery <irishmac473@icloud.com>              ###
;; ### File: init-git.el                                             ###
;; #####################################################################
;; ### Provides the packages and configs to interface with git       ###
;; #####################################################################

;; Magit, the Git interface for Emacs
(use-package magit
  :ensure t
  :bind ("C-c m s" . magit-status))

;; Git-gutter, show diffs in the gutter
(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode t)
  (git-gutter:linum-setup)
  (custom-set-variables
   '(git-gutter:modified-sign "  ")
   '(git-gutter:added-sign "++")
   '(git-gutter:deleted-sign "--"))

  (set-face-background 'git-gutter:modified "yellow") 
  (set-face-foreground 'git-gutter:added "green")
  (set-face-foreground 'git-gutter:deleted "red"))

(provide 'init-git)
