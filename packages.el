;;; packages.el - ghq layer file for Spacemacs
;;
;; Copyright (c) 2018 Seong Yong-ju
;;
;; Author: Seong Yong-ju <sei40kr@gmail.com>
;;
;; This file is not part of GNU Emacs
;;
;;; License: GPLv3

(setq ghq-packages
  '(
     exec-path-from-shell
     ghq
     helm-ghq))

(setq ghq-excluded-packages '())

(defun spacemacs-ghq/post-init-exec-path-from-shell ()
  (evil-after-load 'exec-path-from-shell
    '(add-to-list exec-path-from-shell-variables "GHQ_ROOT")))

(defun spacemacs-ghq/init-ghq ()
  (use-package ghq
    :commands (ghq ghq-ssh ghq-list ghq-list-full-path helm-ghq-list)))

(defun spacemacs-ghq/init-helm-ghq ()
  (use-package helm-ghq
    :defer t))
