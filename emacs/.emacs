;;; -*- lexical-binding: t; -*-
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(load-theme 'vscode-dark-plus t)
(setq display-line-numbers 'relative)

(require 'flymake)

(add-hook 'emacs-lisp-mode-hook 'company-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

;;; [b]etter [tldr]

(setq better-tldr-highlights
      '(("--?[^ =]+=?" . 'font-lock-builtin-face)
	("\\<\\(bool\\|int\\|float\\|char\\|string\\|command\\|file\\|directory\\|path\\|any\\)\\>" . 'font-lock-keyword-face)
	("\\<\\(See also\\|Aliases\\|More information\\)\\>" . 'font-lock-type-face)
	("\\<https:.+" . 'font-lock-constant-face)
	("/\\??\\|\\+\\|\\*" . 'font-lock-constant-face)
	("\\[[^ ]+\\]" . 'font-lock-comment-face)
	("\\<stdin\\|stdout\\|stderr\\>" . 'font-lock-builtin-face)
	("^[-#>]" . 'font-lock-string-face)))

(define-derived-mode better-tldr-mode fundamental-mode "better-tldr"
  "Major mode for Better TlDr pages."
  (setq font-lock-defaults '(better-tldr-highlights)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(vscode-dark-plus-theme rainbow-delimiters company package-lint markdown-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
