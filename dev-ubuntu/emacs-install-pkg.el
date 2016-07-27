;;
;; Install package from command line. Example:
;;
;;   $ emacs --batch --eval "(defconst pkg-to-install 'smex)" -l emacs-install-pkg.el
;;

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

;; Fix HTTP1/1.1 problems
(setq url-http-attempt-keepalives nil)

(package-refresh-contents)

(package-install pkg-to-install)
