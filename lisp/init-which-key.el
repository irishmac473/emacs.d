;; ############################################################################
;; ### Author: Caleb McCaffery <irishmac473@icloud.com>                     ###
;; ### File: init-which-key.el                                              ###
;; ############################################################################
;; ### Provides the Which Key package                                       ###
;; ############################################################################

;; A minor mode for Emacs that displays the key bindings following your 
;; currently entered incomplete command (a prefix) in a popup.
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(provide 'init-which-key)
