;; #####################################################################
;; ### Author: Caleb McCaffery <irishmac473@icloud.com>              ###
;; ### File: init-basics.el                                          ###
;; #####################################################################
;; ### Provides Configurations, packages and functions that make     ###
;; ### Emacs behave the way I like.                                  ###
;; #####################################################################

;; Personal Info
(setq user-full-name "Caleb McCaffery"
      user-mail-address "irishmac473@icloud.com")

;; Get rid of the tool bar & menu bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Disable splash screen and startup message
(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)

;; Silence the annoying notifications
(setq ring-bell-function 'ignore)

;; Backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control 1)
(setq vc-make-backup-files t)

;; Keep emacs Custom-settings in separate file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Frame startup size
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . fullheight))

;; Highlight the current line
(global-hl-line-mode)

;; Ibuffer
(defalias 'list-buffers 'ibuffer-other-window)
(setq ibuffer-default-sorting-mode 'major-mode)

;; Line by line scrolling
(setq scroll-step 1)

;; Set fill column
(setq-default fill-column 72)

;; Set the default comment column
(setq-default comment-column 72)

;; Turn off word wrap
(setq-default truncate-lines 1)

;; Indent size
(setq standard-indent 2)

;; Treat new buffers as text
(setq default-major-mode 'text-mode)

;; Turn off tab
(setq-default indent-tabs-mode nil)

;; Time in modeline
(setq display-time-24hr-format t)
(display-time-mode 1)

;; Column numbers
(column-number-mode 1)

;; Remember where point was in file
(save-place-mode 1)

;; Font
(add-to-list 'default-frame-alist
             '(font . "Ubuntu Mono-16"))

;; Show relative line numbers
(add-hook 'prog-mode-hook (lambda () (setq display-line-numbers 'relative)))

;;  Using Swiper now
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)


;; Packages that IMHO shoud be part of Emacs

;; Agressive indenting
(use-package aggressive-indent
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'aggressive-indent-mode))

(use-package hide-mode-line
  :ensure t)

;; Functions

;; Change window splitting to prefer side by side
(defun my-split-window-sensibly (&optional window)
  (let ((window (or window (selected-window))))
    (or (and (window-splittable-p window t)
             ;; Split window horizontally.
             (with-selected-window window
               (split-window-right)))
        (and (window-splittable-p window)
             ;; Split window vertically.
             (with-selected-window window
               (split-window-below)))
        (and (eq window (frame-root-window (window-frame window)))
             (not (window-minibuffer-p window))
             ;; If WINDOW is the only window on its frame and is not the
             ;; minibuffer window, try to split it horizontally disregarding
             ;; the value of `split-width-threshold'.
             (let ((split-width-threshold 0))
               (when (window-splittable-p window t)
                 (with-selected-window window
                   (split-window-right))))))))

(setq split-window-preferred-function 'my-split-window-sensibly)

(provide 'init-basics)
