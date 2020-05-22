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
    "0" 'delete-window
    "1" 'delete-other-windows
    ";" 'comment-line
    "'" 'vterm-other-window
    "," 'swiper-isearch
    "." 'avy-goto-char
    "<" 'ivy-switch-buffer
    ">" 'ace-window
    "/" 'counsel-find-file
    "b" '(:ignore t :which-key "Buffers")
    "bb" 'ivy-switch-buffer
    "c" '(:ignore t :which-key "Comments")
    "cc" 'comment-line
    "f" '(:ignore t :which-key "Files")
    "ff" 'counsel-find-file
    "g" '(:ignore t :which-key "Git")
    "gs" 'magit-status
    "h" '(:ignore t :which-key "Help")
    "hk" 'describe-key
    "o" '(:ignore t :which-key "Org")
    "oa" 'org-agenda
    "oc" 'org-capture
    "od" 'org-deadline
    "oP" 'org-set-property
    "op" 'org-priority
    "or" 'org-refile
    "os" 'org-schedule
    "ot" 'org-set-tags-command
    "o TAB" 'org-todo
    "s" '(:ignore t :which-key "Search")
    "sg" 'avy-goto-char
    "sG" 'avy-goto-char-timer
    "si" 'imenu
    "ss" 'swiper-isearch
    "t" '(:ignore t :which-key "Terminals")
    "ta" 'ansi-term
    "te" 'eshell
    "tt" 'term
    "tv" 'vterm
    "w" '(:ignore t :which-key "Windows")
    "wd" 'delete-window
    "wo" 'delete-other-windows
    "ww" 'ace-window
    ))

(provide 'init-key-bindings)
