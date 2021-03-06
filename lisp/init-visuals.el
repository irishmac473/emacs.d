;; #####################################################################
;; ### Author: Caleb McCaffery <irishmac473@icloud.com>              ###
;; ### File: init-visuals.el                                         ###
;; #####################################################################
;; ### Provides visual niceties such as color schemes and a custom   ###
;; ### mode line                                                     ###
;; #####################################################################

;; ============================================================================
;; 1.0 Color schemes
;; ============================================================================

(use-package alect-themes
  :ensure t
  )

(use-package doom-themes
  :ensure
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t ;; if nil, bold is universally disabled
        doom-themes-enable-italic t) ;; if nil, italics is universally disabled
  (load-theme 'doom-one t)
  ;; flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;;enable custom neotree theme (all-the-icons must be installed)
  ;;(doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)

  ;; corrects (and imporves) org-mode's native fontification
  (doom-themes-org-config))

;; ============================================================================
;; 2.0 Mode-line
;; ============================================================================

;; required by doom-modeline - After installed, run M-x
;; all-the-icons-install-fonts
(use-package all-the-icons)

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1))

;; ============================================================================
;; 3.0 Other Niceties
;; ============================================================================

;; Pretty matching parens
(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; Highlight indention levels
(use-package highlight-indent-guides
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-character ?\|)
  (setq highlight-indent-guides-responsive 'stack)
  (setq highlight-indent-guides-delay 0))


(provide 'init-visuals)
