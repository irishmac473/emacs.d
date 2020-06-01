;; #####################################################################
;; ### Author: Caleb McCaffery <irishmac473@icloud.com>              ###
;; ### File: init-org.el                                             ###
;; #####################################################################
;; ### Provides configurations and packages for Org-mode             ###
;; #####################################################################

;; =====================================================================
;; 1.0 Org Configuration
;; =====================================================================

(setq org-directory "~/Dropbox/org")
(setq org-default-notes-file "~/Dropbox/org/00-INBOX.org")

;; Tell agenda where to look 
(setq org-agenda-files (quote ("~/Dropbox/org")))


;; Different states for todos
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "SOMEDAY(s)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "|" "CANCELED(c@/!)"))))

;; Trying out some different todo faces
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "yellow" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("SOMEDAY" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold))))

;; Changing todo states also auto adds some tags
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("SOMEDAY" ("SOMEDAY" . t))
              (done ("WAITING") ("SOMEDAY"))
              ("TODO" ("WAITING") ("CANCELLED") ("SOMEDAY"))
              ("NEXT" ("WAITING") ("CANCELLED") ("SOMEDAY"))
              ("DONE" ("WAITING") ("CANCELLED") ("SOMEDAY")))))

;; Tags with fast selection keys
(setq org-tag-alist (quote ((:startgroup)
                            ("@errand" . ?e)
                            ("@work" . ?w)
                            ("@home" . ?h)
                            ("@call" . ?c)
                            ("@email" . ?E)
                            ("@computer" . ?c)
                            ("@iOS" . ?i)
                            ("@mail" . ?M)
                            ("jill" . ?j)
                            ("madisyn" . ?m)
                            ("nathan" . ?N)
                            (:endgroup)
                            ("WAITING" . ?w)
                            ("SOMEDAY" . ?s)
                            ("NEXT" . ?n)
                            ("CANCELLED" . ?c)
                            ("PROJECT" . ?p)
                            ("ROUTINE" . ?r))))

;; Allow setting single tags without the menu
;; (setq org-fast-tag-selection-single-key (quote expert))

;; ;; Set ability to refile into any agenda file 5 nodes deep
(setq org-refile-targets '((org-agenda-files :maxlevel . 5)))

;; ;; We want the ability to create new parents when refiling
(setq org-refile-allow-creating-parent-nodes 'confirm)

;; (setq org-capture-templates
;;       '(("j" "Journal" entry (file+olp+datetree "~/Dropbox/org/journal.org") "* %i\n %?\n")))

;; =====================================================================
;; 2.0 Packages
;; =====================================================================

;; Provide pretty bullets
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-roam
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/Dropbox/org")
  :config
  (setq org-roam-completion-system 'ivy))

(use-package company-org-roam
  :config
  (push 'company-org-roam company-backends))

(use-package org-journal
  :custom
  (org-journal-dir "~/Dropbox/org")
  (org-journal-file-format "%Y%m%d.org")
  (org-journal-date-prefix "#+TITLE: ")
  (org-journal-date-format "%A, %B %d %Y")
  (org-journal-time-prefix "* ")
  :config
  (setq org-journal-enable-agenda-integration t)
  (setq org-journal-enable-cache t))

;; Super charge your agenda view with SUPER AGENDA!!!
(use-package org-super-agenda
  :after org-agenda
  :init
  (setq org-agenda-skip-scheduled-if-done t
        org-agenda-skip-deadline-if-done t
        org-agenda-include-deadlines t
        ;; org-agenda-block-separator nil
        ;; org-agenda-compact-blocks t
        org-agenda-start-day nil ;; i.e. today
        org-agenda-span 1
        org-agenda-start-on-weekday nil)
  (setq org-agenda-custom-commands
        '(("c" "Super view"
           ((agenda "" ((org-agenda-overriding-header "")
                        (org-super-agenda-groups
                         '((:name "Today"
                                  :time-grid t
                                  :date today
                                  :order 1)))))
            (alltodo "" ((org-agenda-overriding-header "")
                         (org-super-agenda-groups
                          '((:log t)
                            (:name "Important"
                                   :priority "A"
                                   :order 1)
                            (:name "Due Today"
                                   :deadline today
                                   :order 2)
                            (:name "Next to do"
                                   :todo "NEXT"
                                   :order 3)
                            (:name "Overdue"
                                   :deadline past
                                   :order 4)
                            (:name "Due Soon"
                                   :deadline future
                                   :order 5)
                            (:name "Projects"
                                   :children t
                                   :order 6)
                            (:name "Task"
                                   :and (:todo ("TODO")
                                               :not (:tag ("ROUTINE")))
                                   :order 7)
                            (:name "Waiting"
                                   :tag "WAITING"
                                   :order 8)
                            (:name "Someday/Maybe"
                                   :todo "SOMEDAY"
                                   :order 99)
                            (:discard (:tag "ROUTINE"))))))))))
  :config
  (org-super-agenda-mode))

(provide 'init-org)
