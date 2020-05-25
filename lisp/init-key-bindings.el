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
    "a" '(:ignore t :which-key "Apps")
    "ac" 'calculator
    "aj" '(:ignore t :which-key "Journal")
    "ajb" 'org-mark-ring-goto
    "ajc" 'org-journal-carryover
    "ajj" 'org-journal-new-entry
    "ajo" 'org-journal-open-entry
    "ajS" 'org-journal-search-forever
    "ajs" 'org-journal-new-scheduled-entry
    "am" '(:ignore t :which-key "Mu4e")
    "amm" 'mu4e
    "ao" '(:ignore t :which-key "Org")
    "ao[" 'org-previous-link
    "ao]" 'org-next-link
    "aoa" 'org-agenda
    "aoc" 'org-capture
    "aod" 'org-deadline
    "aoP" 'org-set-property
    "aop" 'org-priority
    "aoR" 'org-refile
    "aos" 'org-schedule
    "aot" 'org-set-tags-command
    "ao TAB" 'org-todo
    "ao RET" 'org-open-at-point
    "ar" '(:ignore t :which-key "Roam")
    "arc" 'org-roam-capture
    "ard" 'org-roam-db-build-cache
    "arf" 'org-roam-find-file
    "arg" 'org-roam-graph
    "ari" 'org-roam-insert
    "arr" 'org-roam
    "art" 'org-roam-dailies-today
    "b" '(:ignore t :which-key "Buffers")
    "bb" 'ivy-switch-buffer
    "bd" 'kill-buffer
    "bn" 'next-buffer
    "bp" 'previous-buffer
    "c" '(:ignore t :which-key "Comments")
    "cc" 'comment-line
    "f" '(:ignore t :which-key "Files")
    "ff" 'counsel-find-file
    "g" '(:ignore t :which-key "Git")
    "gs" 'magit-status
    "h" '(:ignore t :which-key "Help")
    "hk" 'describe-key
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
    "w/" 'split-window-right
    "w-" 'split-window-below
    "w0" 'delete-window
    "wd" 'delete-other-windows
    "ww" 'ace-window
    ))

(provide 'init-key-bindings)
