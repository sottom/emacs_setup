
;; Initialize installed packages
(package-initialize)  

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; LINE NUMBERING
;; get line numbers
(global-linum-mode)
;; get line numbers relative to the line I'm on
(linum-relative-global-mode)


;; SET UP VIM KEY BINDINGS
(require 'evil)
(evil-mode 1)
;; allow C-u to scroll up
(setq evil-want-C-u-scroll t)
;; set up evil-nerd-commenter hotkeys
(evilnc-default-hotkeys)
;; evil numbers
(require 'evil-numbers)
(global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)

;; CHANGE THE LOOK OF EMACS SIDE BAR
;; change the current line symbol to absolute linenum ("")
(setq linum-relative-current-symbol "")
;; change the space between my side numbers and code
(setq linum-relative-format "  %3s-|")


;; GIT
(global-set-key (kbd "C-x g") 'magit-status)


;; NEW KEY BINDINGS
(global-set-key (kbd "C-'") 'evil-prev-buffer)
(global-set-key (kbd "C-;") 'buf-move-right)
(global-set-key (kbd "C-,") 'buf-move-left)
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)


;; REMOVE TOOLBAR FROM WINDOW
(setq visible-bell 1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)


;; SNIPPETS
(yas-global-mode 1)


;; SKEWER LIVE UPDATE HTML, CSS, JS
(require 'simple-httpd)
(skewer-setup)


;; ORG MODE 
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;; helps orgmode know wich files to search for todos and scheduled items
(setq org-agenda-files (list "~/org/work.org"
                             "~/org/school.org" 
                             "~/org/home.org"))


;; TRUNCATE LINES
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;; (add-to-list 'auto-mode-alist '("\\.org\\'" . auto-fill-mode))
;; (setq fill-column 80)


;; INDENTATION 
(progn
  ;; make indentation commands use space only (never tab character)
  (setq-default indent-tabs-mode nil)
  ;; emacs 23.1, 24.2, default to t
  ;; if indent-tabs-mode is t, it means it may use tab, resulting mixed space and tab
  )
(setq js2-basic-offset 2)


;:; EASIER FILE FINDING
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(global-set-key
     "\M-x"
     (lambda ()
       (interactive)
       (call-interactively
        (intern
         (ido-completing-read
          "M-x "
          (all-completions "" obarray 'commandp))))))
;; remembers common commands
(require 'smex) ; Not needed if you use package.el
  (smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                    ; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  ;; causes an error if set
  ;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; THEMES SET UP BY CUSOMIZE-THEMES COMMAND
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (atom-dark)))
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "e9460a84d876da407d9e6accf9ceba453e2f86f8b86076f37c08ad155de8223c" "ab0950f92dc5e6b667276888cb0cdbc35fd1c16f667170a62c15bd3ed5ae5c5a" "19ba41b6dc0b5dd34e1b8628ad7ae47deb19f968fe8c31853d64ea8c4df252b8" "ac16245796399c31a7c3ab6a4c0ecf88add866a988d2928248a260b8149ea4ad" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(fci-rule-color "#383838")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



; Add proper word wrapping
(global-visual-line-mode t)


; save the place in files
(require 'saveplace)
(setq-default save-place t)


;; UPDATED PACKAGE LIST UI
(require 'paradox)
(paradox-enable)

(require 'evil-surround)
(global-evil-surround-mode 1)

;;autocomplete parentheses
(smartparens-global-mode t)


;; json mode
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(global-set-key (kbd "C-x j")'json-pretty-print)


;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;; autocomplete mode
;; (global-auto-complete-mode)
;;autocomplete js2-mode
;; (add-hook 'js2-mode-hook 'ac-js2-mode)
;; `(setq ac-js2-evaluate-calls t)'


;; EMMET MODE
(emmet-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . html-mode))
(global-set-key (kbd "TAB") 'emmet-expand-line)

;; jump to definition
(dumb-jump-mode)
