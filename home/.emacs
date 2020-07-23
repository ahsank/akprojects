(setq column-number-mode t)

;; Turn on red highlighting for characters outside of the 80/100 char limit
(add-hook 'c++-mode-hook
          '(lambda () (font-lock-set-up-width-warning 80)))
(add-hook 'java-mode-hook
          '(lambda () (font-lock-set-up-width-warning 100)))
(add-hook 'js-mode-hook
          '(lambda () (font-lock-set-up-width-warning 80)))
(add-hook 'python-mode-hook
            '(lambda () (font-lock-set-up-width-warning 80)))
(add-hook 'sawzall-mode-hook
          '(lambda () (font-lock-set-up-width-warning 80)))
(add-hook 'sh-mode-hook
          '(lambda () (font-lock-set-up-width-warning 80)))

(add-hook 'markdown-mode-hook
          '(lambda () (font-lock-set-up-width-warning 80)))

(global-visual-line-mode 1)
;; (add-hook 'write-file-hooks 'delete-trailing-whitespace)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

(defun copy-to-clipboard ()
  (interactive)
  (if (display-graphic-p)
    (progn
      (message "Yanked region to x-clipboard!")
      (call-interactively 'clipboard-kill-ring-save)
      )
    (if (region-active-p)
      (progn
        (shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
        (message "Yanked region to clipboard!")
        (deactivate-mark))
      (message "No region active; can't yank to clipboard!")))
  )

(defun paste-from-clipboard ()
  (interactive)
  (if (display-graphic-p)
    (progn
      (clipboard-yank)
      (message "graphics active")
      )
    (insert (shell-command-to-string "xsel -o -b"))
    )
  )

(defun set-window-width (n)
  "Set the selected window's width."
  (adjust-window-trailing-edge (selected-window) (- n (window-width)) t))

(defun set-80-columns ()
  "Set the selected window to 80 columns."
  (interactive)
  (set-window-width 81))

;; (global-set-key "\C-x~" 'set-80-columns)

(define-key global-map (kbd "C-x O") 'previous-multiframe-window)
;;(define-key global-map (kbd "M-n") 'other-window)

(add-to-list 'auto-mode-alist '("\\.javascript\\'" . javascript-mode))

;; Make the buffer attached to the window
(defun pin-buffer-to-window ()
  (interactive)
  (set-window-dedicated-p (selected-window) 1))

(global-auto-revert-mode t)
(show-paren-mode t)
(setq split-height-threshold 160)
(setq split-width-threshold 160)
(setq auto-save-default nil) 
;; Disable autmoatic scroll when cursor past top or bottom of the window.
(setq scroll-step 1)
(setq auto-window-vscroll nil)
;;(add-to-list 'custom-theme-load-path "~/src/emacs-color-theme-solarized")
;;(add-to-list 'custom-theme-load-path "~/src/replace-colorthemes")
;; (load-theme 'solarized-dark t)
;; (load-theme 'solarized-light t)
;; (load-theme 'feng-shui t)
;; (require 'color-theme)
;; (color-theme-initialize)
;; (setq color-theme-is-global t)
;;(color-theme-vim-colors)
;;(color-theme-dark-laptop)

;; Reverse colors for the border to have nicer line
(set-face-inverse-video-p 'vertical-border nil)
(set-face-background 'vertical-border (face-background 'default))

;; Set symbol for the border
(set-display-table-slot standard-display-table
                        'vertical-border
                        (make-glyph-code ?│))

(global-set-key "\C-cg" 'goto-line)

(defun google-trim-trailing-whitespace ()
  "Remove trailing whitespace from buffer lines" 
  (interactive)
  (delete-trailing-whitespace))

;; (require 'color-theme-vim-colors)
;; (color-theme-vim-colors)

;; Set transparency of emacs
 (defun set-transparency (value)
   "Sets the transparency of the frame window. 0=transparent/100=opaque"
   (interactive "nTransparency Value 0 - 100 opaque:")
   (set-frame-parameter (selected-frame) 'alpha value))

(setq make-backup-files nil)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" "7f1263c969f04a8e58f9441f4ba4d7fb1302243355cb9faecb55aec878a06ee9" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" default)))
 '(package-selected-packages (quote (go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq js-indent-level 2)

;; (add-to-list 'load-path (expand-file-name "~/work/src/github.com/jaypei/emacs-neotree"))
; (require 'neotree)

(package-initialize)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Interface to eclipse via eclim
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Interface to eclipse via eclim
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-to-list 'load-path (expand-file-name "~/work/src/github.com/magnars/s.el"))
;; (add-to-list 'load-path (expand-file-name "~/work/src/github.com/magnars/dash.el"))
;; (add-to-list 'load-path (expand-file-name "~/work/src/github.com/auto-complete/popup-el"))
;; (add-to-list 'load-path (expand-file-name "~/work/src/github.com/senny/emacs-eclim"))

;;(require 'eclim)
;;(global-eclim-mode)

;; Variables
(setq
;;      eclim-auto-save t
 eclim-eclipse-dirs "/home/ahsan.khan/blt/extra-tools/sfdcEclipse"
 eclim-executable "/home/ahsan.khan/blt/extra-tools/sfdcEclipse/eclim"
;;      eclimd-wait-for-process nil
;;      eclimd-default-workspace "~/src/workspace-eclim"
;;      eclim-use-yasnippet nil
;;      eclim-autoupdate-problems nil
;;      eclim-print-debug-messages nil
 help-at-pt-display-when-idle t
 help-at-pt-timer-delay 1.0
 )

;; regular auto-complete initialization
;; (require 'auto-complete-config)
;; (ac-config-default)

;; add the emacs-eclim source
;; (require 'ac-emacs-eclim-source)
;; (ac-emacs-eclim-config)

;; Call the help framework with the settings above & activate
;; eclim-mode
(help-at-pt-set-timer)

;; restore the window configuration after running certain eclim commands
;; (add-hook 'eclim-problems-mode-hook 'winner-undo)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2015-08-18 eclim fails, added this from
;; https://gist.github.com/mads379/3402786
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun toggle-maximize-buffer ()
;;   (interactive)
;;   (if (= 1 (length (window-list)))
;;       (jump-to-register '_)
;;     (progn
;;       (window-configuration-to-register '_)
;;       (delete-other-windows))))

;; TODO: get this into emacs-eclim
;; d-to-list 'eclim--file-coding-system-mapping '("iso-latin-1-unix" . "iso-8859-1"))

(setq-default fill-column 120)
(setq-default auto-fill-function 'do-auto-fill)
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 2
                                  tab-width 2
                                  indent-tabs-mode nil)))
;; (require 'codesearch)
(global-set-key "\M-." 'codesearch-search)

(defun my-indent-setup ()
  (c-set-offset 'arglist-intro '+))

(add-hook 'java-mode-hook 'my-indent-setup)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
;; (global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 0 will make it unlimited
(setq term-buffer-maximum-size 30000) 

;; Disable scroll bar
(setq scroll-bar-mode -1)

