(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize) ;; You might already have this line

;; ======= set env =========
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(setq standard-indent 4)

;; ========== Line by line scrolling ========== 

;; This makes the buffer scroll by only a single line when the up or
;; down cursor keys push the cursor (tool-bar-mode) outside the
;; buffer. The standard emacs behaviour is to reposition the cursor in
;; the center of the screen, but this can make the scrolling confusing

(setq scroll-step 1)

;; ===== Turn off tab character =====

;;
;; Emacs normally uses both tabs and spaces to indent lines. If you
;; prefer, all indentation can be made from spaces only. To request this,
;; set `indent-tabs-mode' to `nil'. This is a per-buffer variable;
;; altering the variable affects only the current buffer, but it can be
;; disabled for all buffers.

;;
;; Use (setq ...) to set value locally to a buffer
;; Use (setq-default ...) to set value globally 
;;
(setq-default indent-tabs-mode t) 

;; ========== Support Wheel Mouse Scrolling ==========

;;(mouse-wheel-mode t)

;; ========== Prevent Emacs from making backup files ==========

(setq make-backup-files nil) 

;; ============= Syntax highlight ===================
(global-font-lock-mode 1)

;; ==================== C ==============================
(setq-default c-basic-offset 8)
