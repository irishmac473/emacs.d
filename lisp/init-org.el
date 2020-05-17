;; #####################################################################
;; ### Author: Caleb McCaffery <irishmac473@icloud.com>              ###
;; ### File: init-org.el                                             ###
;; #####################################################################
;; ### Provides configurations and packages for Org-mode             ###
;; #####################################################################

;; =====================================================================
;; 1.0 Org Configuration
;; =====================================================================

;; =====================================================================
;; 2.0 Packages
;; =====================================================================

;; Provide pretty bullets
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Org-roam
(use-package org-roam
  :ensure t
  :config
  (setq org-roam-directory "~/Dropbox/org")
  (add-hook 'after-init-hook 'org-roam-mode)
  (setq org-roam-completion-system 'ivy)
  )

(use-package company-org-roam
  :after org-roam
  :config
  (push 'company-org-roam company-backends))

(use-package org-journal
  :bind
  ("C-c n j" . org-journal-new-entry)
  :custom
  (org-journal-date-prefix "#+TITLE: ")
  (org-journal-file-format "%Y-%m-%d.org")
  (org-journal-dir "~/Dropbox/org")
  (org-journal-date-format "%A, %d %B %Y"))

(provide 'init-org)
