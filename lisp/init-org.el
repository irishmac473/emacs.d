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
(setq org-agenda-files (quote ("~/Dropbox/org/00-INBOX.org"
                               "~/Dropbox/org/01-MYLIFE.org"
                               "~/Dropbox/org/02-REFERENCE.org")))

;; Different states for todos
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "SOMEDAY(s)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "|" "CANCELED(c@/!)"))))

;; Trying out some different todo faces
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
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
                            ("@email" . ?e)
                            ("@computer" . ?c)
                            ("@iOS" . ?i)
                            ("@mail" . ?M)
                            ("jill" . ?j)
                            ("madisyn" . ?m)
                            ("nathan" . ?N)
                            (:endgroup)
                            ("WAITING" . ?w)
                            ("SOMEDAY" . ?s)
                            ("NOTE" . ?n)
                            ("CANCELLED" . ?c)
                            ("PROJECT" . ?p)
                            ("FLAGGED" . ??))))

;; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))

;; Set ability to refile into any agenda file 5 nodes deep
(setq org-refile-targets '((org-agenda-files :maxlevel . 5)))

;; We want the ability to create new parents when refiling
(setq org-refile-allow-creating-parent-nodes 'confirm)

(setq org-refile-use-outline-path 'file)

(setq org-outline-path-complete-in-steps nil)

(setq org-capture-templates
      '(("j" "Journal" entry (file+olp+datetree "~/Dropbox/org/journal.org") "* %i\n %?\n")))
;; =====================================================================
;; 2.0 Packages
;; =====================================================================

;; Provide pretty bullets
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Org-roam
;; (use-package org-roam  :ensure t
;;   :config
;;   (setq org-roam-directory "~/Dropbox/org")
;;   (add-hook 'after-init-hook 'org-roam-mode)
;;   (setq org-roam-completion-system 'ivy)
;;   )

;; (use-package company-org-roam
;;   :after org-roam
;;   :config
;;   (push 'company-org-roam company-backends))

;; (use-package org-journal
;;   :ensure t
;;   :defer t
;;   :custom
;;   (org-journal-date-prefix "#+TITLE: ")
;;   (org-journal-file-format "%Y-%m-%d.org")
;;   (org-journal-dir "~/Dropbox/org")
;;   (org-journal-date-format "%A, %d %B %Y")
;;   (org-journal-enable-agenda-intergration t)
;;   (org-journal-update-org-agenda-files))

(provide 'init-org)
