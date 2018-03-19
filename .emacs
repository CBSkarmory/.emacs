(package-initialize)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;stable melpa
(cond
 ((>= 24 emacs-major-version)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
           '("melpa-stable" . "http://stable.melpa.org/packages/") t)
  (package-refresh-contents)
 )
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (monokai)))
    '(custom-safe-themes
	 (quote
	     ("93f9654f91d31e9a9ec6ea2fcffcfcab38353a9588673f2b750e591f704cd633" "cb4cb09f1736cfb2a80ef371c33a9868cbf6707ec5af51d61162483d6c3fbb7c" default)))
    '(ensime-sem-high-faces
	 (quote
	     ((var :foreground "#9876aa" :underline
		  (:style wave :color "yellow"))
		 (val :foreground "#9876aa")
		 (varField :slant italic)
		 (valField :foreground "#9876aa" :slant italic)
		 (functionCall :foreground "#a9b7c6")
		 (implicitConversion :underline
		     (:color "#808080"))
		 (implicitParams :underline
		     (:color "#808080"))
		 (operator :foreground "#cc7832")
		 (param :foreground "#a9b7c6")
		 (class :foreground "#4e807d")
		 (trait :foreground "#4e807d" :slant italic)
		 (object :foreground "#6897bb" :slant italic)
		 (package :foreground "#cc7832")
		 (deprecated :strike-through "#a9b7c6"))))
 '(helm-mode t)
 '(icomplete-mode t)
 '(lisp-body-indent 4)
 '(lisp-indent-offset 4)
    '(package-archives
	 (quote
	     (("gnu" . "http://elpa.gnu.org/packages/")
		 ("MELPA" . "http://melpa.org/packages/"))))
    '(package-selected-packages
	 (quote
	     (ac-helm ggtags markdown-preview-eww markdown-mode+ markdown-preview-mode markdown-mode helm merlin monokai-theme darcula-theme)))
 '(ruby-indent-level 4)
 '(show-paren-mode t)
 '(tuareg-default-indent 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq-default c-basic-offset 4)

(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
      (when (and opam-share (file-directory-p opam-share))
       ;; Register Merlin
       (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
       (autoload 'merlin-mode "merlin" nil t nil)
       ;; Automatically start it in OCaml buffers
       (add-hook 'tuareg-mode-hook 'merlin-mode t)
       (add-hook 'caml-mode-hook 'merlin-mode t)
       ;; Use opam switch to lookup ocamlmerlin binary
       (setq merlin-command 'opam)))
(add-hook 'tuareg-mode-hook 'merlin-mode)
(load "/home/george/.opam/4.04.0/share/emacs/site-lisp/tuareg-site-file")

;;this binds C-x b to helm-mini (switcher)
(helm-mode 1)
(global-set-key (kbd "C-x b") 'helm-mini)

;;this binds m-x to helm-M-x
(global-set-key (kbd "M-x") 'helm-M-x)

;;this binds C-x C-f to helm-find-files
(global-set-key (kbd "C-x C-f") 'helm-find-files)


