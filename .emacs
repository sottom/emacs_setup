;; Convenient package handling in emacs

(require 'package)
;; loading packages
(add-to-list 'load-path "~/.emacs.d/elpa")
;; installing packages
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))
(unless (assoc-default "org" package-archives)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)) 
;; use packages from marmalade
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;; and the old elpa repo
(add-to-list 'package-archives '("elpa-old" . "http://tromey.com/elpa/"))
;; and automatically parsed versiontracking repositories.
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;; Make sure a package is installed
(defun package-require (package)
  "Install a PACKAGE unless it is already installed 
or a feature with the same name is already active.

Usage: (package-require 'package)"
  ; try to activate the package with at least version 0.
  (package-activate package '(0))
  ; try to just require the package. Maybe the user has it in his local config

  (condition-case nil
      (require package)
    ; if we cannot require it, it does not exist, yet. So install it.
    (error (progn
             (package-install package)
             (require package)))))

;; Initialize installed packages
(package-initialize)  
;; package init not needed, since it is done anyway in emacs 24 after reading the init
;; but we have to load the list of available packages, if it is not available, yet.
(when (not package-archive-contents)
  (with-timeout (15 (message "updating package lists failed due to timeout"))
    (package-refresh-contents)))


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
;;(yas-global-mode)


;; SKEWER LIVE UPDATE HTML, CSS, JS
;; (require 'simple-httpd)
;; (skewer-setup)


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

; Add proper word wrapping
(global-visual-line-mode t)


; save the place in files
(require 'saveplace)
(setq-default save-place t)


;; UPDATED PACKAGE LIST UI
;; (require 'paradox)
;; (paradox-enable)

(require 'evil-surround)
(global-evil-surround-mode 1)

;;autocomplete parentheses
;; (smartparens-global-mode t)


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
(global-auto-complete-mode)
;;autocomplete js2-mode
;; (add-hook 'js2-mode-hook 'ac-js2-mode)
;; `(setq ac-js2-evaluate-calls t)'


