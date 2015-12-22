;; 言語を日本語にする
(set-language-environment 'Japanese)
;; 極力UTF-8とする
(prefer-coding-system 'utf-8)

;; Emacs-BGEX patch
(load-file "~/workspace/emacs-24.4/src/tmp/patch-bgex_20140112_0-bzr-emacs-trunk/bgex.el")
(require 'bgex)

;; color
(when (boundp 'bgex-exist-p)
  (bgex-set-image-default "~/workspace/emacs-24.4/src/tmp/patch-bgex_20140112_0-bzr-emacs-trunk/bis1_black.png"))
