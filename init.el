;;######################################################################
;;### Author: Caleb McCaffery <irishmac473@icloud.com>               ###
;;### File: init.el                                                  ###
;;######################################################################
;;### My Emacs Config                                                ###
;;######################################################################

;; =====================================================================
;; 1.0 Load paths
;; =====================================================================

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

;; =====================================================================
;; 2.0 Load configs for various settings, features and modes
;; =====================================================================

;; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; Bootstrap config
;; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

(require 'init-elpa)

;; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; UX - Make Emacs usable
;; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

(require 'init-basics)
(require 'init-visuals)

;; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; Packages
;; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

(require 'init-which-key)
(require 'init-dashboard)
(require 'init-org)
(require 'init-ace)
(require 'init-search)
(require 'init-completion)
(require 'init-git)

;; Packages don't get their own file till I need to add some configs

;; Allows you to try out packages without installing them
(use-package try
  :ensure t)

;; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; Languages
;; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
