
;;  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;;; Code:

(package-initialize)


;; 鼠标
(xterm-mouse-mode 1)
(mouse-wheel-mode t)

(global-set-key (kbd "<mouse-5>") '(lambda () (interactive) (scroll-up 1)))
(global-set-key (kbd "<mouse-4>") '(lambda () (interactive) (scroll-down 1)))


;;背景
(load-theme 'alect-light t)

;;buffer提示
(ido-mode 1)

;;打字游戏
 (autoload 'typing-of-emacs "typing" "The Typing Of Emacs, a game." t)

;;复制粘贴到系统剪切板
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)


;;window move
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
(global-set-key (kbd "C-x <left>")  'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <up>")    'windmove-up)
(global-set-key (kbd "C-x <down>")  'windmove-down)

(elpy-enable)
(setq-default cursor-type 'bar)
;;(setq python-shell-interpreter "python")
;;取消警告
(setq python-indent-guess-indent-offset t)  
(setq python-indent-guess-indent-offset-verbose nil)

;;Latex
(setq TeX-auto-save t)
    (setq TeX-parse-self t)
    (setq-default TeX-master nil)
    (add-hook 'LaTeX-mode-hook 'visual-line-mode)
    (add-hook 'LaTeX-mode-hook 'flyspell-mode)
    (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
    (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
    (setq reftex-plug-into-AUCTeX t)
;;LaTeX自动补全
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "auto-complete-extension")


;;Python 代码提示
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)


;;python 格式化
(add-to-list 'load-path "/Library/Frameworks/Python.framework/Versions/3.7/bin/yapf")
(require 'py-yapf)
(add-hook 'python-mode-hook 'py-yapf-enable-on-save)
;;(setq python-shell-interpreter "ipython"
;;      python-shell-interpreter-args "-i --simple-prompt")

;;彩虹猫
;(add-to-list 'load-path "~/.emacs.d/nyan-mode")
;(require 'nyan-mode)
;(nyan-mode t);;启动nyan-mode
;(nyan-start-animation);;开始舞动吧（会耗cpu资源）



;;python语法检查
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

;; 没啥用
(add-to-list 'python-shell-completion-native-disabled-interpreters "jupyter")
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt")
;;      python-shell-prompt-detect-failure-warning nil)

;;智能补全
(require 'company-tabnine)
(add-to-list 'company-backends #'company-tabnine)
(setq company-idle-delay 0)
(setq company-show-numbers t)

;;定义跳跃
(require 'use-package)
(use-package dumb-jump
  :ensure t
  :bind (("M-g o" . dumb-jump-go-other-window)
      ("M-g j" . dumb-jump-go)
      ("M-g b" . dumb-jump-back)
      ("M-g q" . dumb-jump-quick-look)
      ("M-g x" . dumb-jump-go-prefer-external)
      ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config (setq dumb-jump-selector 'ivy))
  

;;头文件C++模式
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(setq package-user-dir "~/.emacs.d/elpa")

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(package-initialize)

(package-initialize)

;; Uncomment this next line if you want line numbers on the left side
;(global-linum-mode 1)


;; Sets our compilation key binding to C-c C-v
(global-set-key "\C-c\C-v" 'compile)

;设置所在行高亮
(global-hl-line-mode t)
(set-face-background 'hl-line "#f2ffdc")

;;设置缩进提示竖线
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(add-hook 'text-mode-hook 'highlight-indent-guides-mode)
(require 'highlight-indent-guides)
(setq highlight-indent-guides-method 'column)
(setq highlight-indent-guides-auto-enabled nil)

(set-face-background 'highlight-indent-guides-odd-face "darkgray")
(set-face-background 'highlight-indent-guides-even-face "gray")
;(set-face-foreground 'highlight-indent-guides-character-face "white")



(setq line-number-mode t)
(setq column-number-mode t)
(display-time)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;;This makes rainbow delimiters mode the default.
;;comment out to turn it off.
(add-hook 'find-file-hook 'rainbow-delimiters-mode-enable)

;;Want electric pair mode? Uncomment the next line
(electric-pair-mode)

;;Want to turn off show paren mode? Comment out the below line.
(show-paren-mode)
(setq show-paren-style 'expression)


(global-set-key "\C-x\C-g" 'goto-line)

;; these change the colors for rainbow delimters.   Dont' change them here!
;; change them in M-x customize
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "color-153"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "color-92"))))
 '(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "color-167"))))
 '(rainbow-delimiters-depth-6-face ((t (:inherit rainbow-delimiters-base-face :foreground "color-40"))))
 '(rainbow-delimiters-unmatched-face ((t (:inherit rainbow-delimiters-base-face :background "red" :foreground "black")))))

;; Automatically set compilation mode to
;; move to an error when you move the point over it
;; Dont want this behavior? commend out the next 4 lines.
(add-hook 'compilation-mode-hook
 (lambda () 
   (progn
     (next-error-follow-minor-mode))))

;;Automatically go to the first error
;;Dont want this behavior? comment out next line
(setq compilation-auto-jump-to-first-error t)


;;This prevents gdb from getting a dedicated window,
;;which is generally super annoying
(defun set-window-undedicated-p (window flag)
  "Never set window dedicated."
  flag)
(advice-add 'set-window-dedicated-p :override #'set-window-undedicated-p)


;;Autocompletion from company
(require 'company)
(require 'company-rtags)
;; This turns on autocomplete globally. Want to turn it off (why???) comment out next line.
(global-company-mode)
(add-to-list 'company-backends 'company-c-headers)

;;clang-format to format file reasonably.  Do NOT turn off!
(require 'clang-format)
(global-set-key [C-M-tab] 'clang-format-region)
(add-hook 'c-mode-common-hook
          (function (lambda ()
                    (add-hook 'write-contents-functions
                              (lambda() (progn (clang-format-buffer) nil))))))


(add-hook 'cpp-mode-common-hook
          (function (lambda ()
                      (add-hook 'write-contents-functions
                                (lambda() (progn (clang-format-buffer) nil))))))

;; Flycheck: show you whats wrong while you write
;; Dont want?  comment out next 3 lines.
;; Dont want popups with whats wrong?  comment out third line only
(require 'flycheck)
(global-flycheck-mode)
(flycheck-popup-tip-mode)


;; This does the popup menu for M-y.
;; if you dont want it, you can comment out the next 12 lines.
(require 'popup-kill-ring)
(defun drew-popup-kill-ring(&optional arg)
  (interactive "*p")
  (if  (eq last-command 'yank)
      (let ((inhibit-read-only t)
            (before (< (point) (mark t))))
        (if before
            (funcall (or yank-undo-function 'delete-region) (point) (mark t))
          (funcall (or yank-undo-function 'delete-region) (mark t) (point)))))
  (popup-kill-ring))
(global-set-key "\M-y" 'drew-popup-kill-ring)
(setq popup-kill-ring-interactive-insert t)



;;This just shows your grade.txt files in color and read only.
;(defun colorize-grade-txt ()
 ; "Make a grade.txt file show colors, then set read only."
;  (interactive)
;  (if (or (string= (buffer-name) "grade.txt")
;          (string-prefix-p (buffer-name) "grade.txt<"))
;      (progn (let ((inhibit-read-only t))
;               (ansi-color-apply-on-region (point-min) (point-max)))
;             (set-buffer-modified-p nil)
;             (read-only-mode t))))

;(add-hook 'find-file-hook 'colorize-grade-txt)
;;company mode doesnt play well with gdb mode.  Leave this here
(add-hook 'gud-mode-hook (lambda() (company-mode 0)))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   (quote
    (auto-complete-auctex auctex auctex-latexmk alect-themes solarized-theme nyan-mode dumb-jump company-tabnine anaconda-mode jedi yapfify py-yapf flymake-python-pyflakes jupyter elpy clang-format+ xterm-color rainbow-delimiters popup-kill-ring ggtags flycheck-popup-tip flycheck-clang-tidy flycheck-clang-analyzer cpp-auto-include company-rtags company-c-headers company clang-format))))


(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

(elpy-enable)

(provide '.emacs)
;;; .emacs ends here


