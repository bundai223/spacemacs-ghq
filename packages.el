;;; packages.el - ghq layer file for Spacemacs
;;
;; Copyright (c) 2018 Seong Yong-ju
;;
;; Author: Seong Yong-ju <sei40kr@gmail.com>
;;
;; This file is not part of GNU Emacs
;;
;;; License: GPLv3

(setq ghq-packages '(
                     ghq
                     helm-ghq
                     magit))

(setq ghq-excluded-packages '())

(defun ghq/init-ghq ()
  (use-package ghq
    :defer (spacemacs/defer)))

(defun ghq/init-helm-ghq ()
  (use-package helm-ghq
    :defer (spacemacs/defer)
    :init
    (setq helm-ghq-command-ghq-arg-list '("list"))))

(defun ghq/post-init-magit ()
  (with-eval-after-load 'magit-repos
    (require 'ghq)
    (add-to-list 'magit-repository-directories (cons (ghq--find-root) 3))))
