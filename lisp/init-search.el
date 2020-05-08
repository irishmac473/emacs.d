;; #####################################################################
;; ### Author: Caleb McCaffery <irishmac473@icloud.com>              ###
;; ### File: init-search.el                                          ###
;; #####################################################################
;; ### Provides the swiper, ivy, avy and counsel packages            ###
;; #####################################################################

;; Ivy, a generic completion mechanism for Emacs.
;; Counsel, a collection of Ivy-enhanced versions of common Emacs
;; commands.
;; Swiper, an Ivy-enhanced alternative to isearch.
;; Avy, a package for jumping to visible text using a char-based
;; decision tree.

(use-package counsel
  :ensure t
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-display-style 'fancy))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper-isearch)
	 ("C-r" . swiper-isearch)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(use-package avy
  :ensure t
  :bind (("C-'" . avy-goto-char-timer)
         ("C-:" . avy-goto-char)))

(provide 'init-search)
