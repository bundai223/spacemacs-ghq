;;; packages.el - ghq layer file for Spacemacs
;;
;; Copyright (c) 2018 Seong Yong-ju
;;
;; Author: Seong Yong-ju <sei40kr@gmail.com>
;;
;; This file is not part of GNU Emacs
;;
;;; License: GPLv3

(setq spacemacs-ghq-packages
  '(
     exec-path-from-shell
     ghq
     helm-ghq
     magit
     ))

(setq spacemacs-ghq-excluded-packages '())

(defun spacemacs-ghq/post-init-exec-path-from-shell ()
  (eval-after-load 'exec-path-from-shell
    '(add-to-list 'exec-path-from-shell-variables "GHQ_ROOT")))

(defun spacemacs-ghq/init-ghq ()
  (use-package ghq
    :commands (ghq ghq-ssh ghq-list ghq-list-full-path helm-ghq-list)))

(defun spacemacs-ghq/init-helm-ghq ()
  (use-package helm-ghq
    :defer t
    :init
    (custom-set-variables
      '(helm-ghq-command-ghq-arg-list '("list"))
      '(helm-ghq-command-git-arg-ls-files '("ls-files" "-co" "--exclude-standard" "--")))))

(defun spacemacs-ghq/pre-init-magit ()
  (with-eval-after-load 'magit-repos
    (defun magit-list-repos ()
      (require 'ghq)
      (ghq--find-projects-full-path))))
