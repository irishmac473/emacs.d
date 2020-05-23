;; #####################################################################
;; ### Author: Caleb McCaffery <irishmac473@icloud.com>              ###
;; ### File: init-mail.el                                            ###
;; #####################################################################
;; ### Provides email with mu4e and smtpmail                         ###
;; #####################################################################

;; =====================================================================
;; 1.0 Org Configuration
;; =====================================================================

(use-package mu4e
  :config
  (setq mu4e-update-interval 120) ;; update every 2 minutes
  (setq mu4e-headers-auto-update t)
  (setq mu4e-headers-skip-duplicates t)
  (setq mu4e-view-show-images t
        mu4e-show-images t
        mu4e-view-image-max-width 800
        mu4e-use-fancy-chars t
        mu4e-view-show-addresses t)
  (setq message-kill-buffer-on-exit t)
  (setq mu4e-maildir "~/Mail")
  (setq mu4e-get-mail-command "/usr/bin/mbsync -a")
  (setq mu4e-html2text-command "/usr/bin/w3m -T text/html")
  (setq mu4e-drafts-folder "/icloud/Drafts")
  (setq mu4e-sent-folder "/icloud/Sent Messages")
  (setq mu4e-trash-folder "/icloud/Deleted Messages")
  (setq mu4e-refile-folder "/icloud/Archive")
  (setq
   user-mail-address "irishmac473@icloud.com"
   user-full-name "Caleb McCaffery")
  (setq mu4e-change-filenames-when-moving t) ;; Apparently this is needed when using mbsync
  (setq mu4e-maildir-shortcuts
        '( (:maildir "/icloud/inbox"                :key ?i)
           (:maildir "/icloud/Archive"              :key ?a)
           (:maildir "/icloud/Drafts"               :key ?d)
           (:maildir "/icloud/Junk"                 :key ?j)
           (:maildir "/icloud/Deleted Messages"   :key ?t)
           (:maildir "/icloud/Sent Messages"      :key ?s)))
  (setq mu4e-bookmarks
        '(("flag:unread AND NOT flag:trashed" "Unread messages"  ?u)
          ("date:today..now" "Today's messages" ?t)
          ("date:7d..now" "Last 7 days" ?w)
          ("mime:image/*" "Messages with images" ?p))))

(setq message-send-mail-function 'message-send-mail-with-sendmail
      sendmail-program "/usr/bin/msmtp")

(provide 'init-mail)
