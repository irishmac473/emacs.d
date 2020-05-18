;; #####################################################################
;; ### Author: Caleb McCaffery <irishmac473@icloud.com>              ###
;; ### File: init-key-bindings.el                                    ###
;; #####################################################################
;; ### Provides the Which Key package and key bindings with the      ###
;; ### General package                                               ###
;; #####################################################################

;; A minor mode for Emacs that displays the key bindings following your 
;; currently entered incomplete command (a prefix) in a popup.
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package general
  :ensure t
  :config
  (general-unbind
    "M-SPC")
  (general-create-definer my-leader-def
    :prefix "M-SPC")
  (my-leader-def
    "SPC" 'counsel-M-x
    "0" 'delete-windows
    "1" 'delete-other-windows
    "'" 'vterm-other-window
    "<" 'ivy-switch-buffer
    ">" 'ace-window
    "g" '(:ignore t :which-key "Git")
    "gs" 'magit-status
    "o" '(:ignore t :which-key "Org")
    "oj" '(:ignore t :which-key "Org-Journal")
    "ojn" 'org-journal-new-entry
    "or" '(:ignore t :which-key "Org-roam")
    "orn" 'org-roam-insert
    "orr" 'org-roam
    ))

(provide 'init-key-bindings)
