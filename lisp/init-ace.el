;; #####################################################################
;; ### Author: Caleb McCaffery <irishmac473@icloud.com>              ###
;; ### File: init-ace.el                                             ###
;; #####################################################################
;; ### Provides the Ace-window package                               ###
;; #####################################################################

;; This package aims to take the speed and predictability of windmove
;; and pack it into a single key binding, similar to other-window.
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))

(provide 'init-ace)
