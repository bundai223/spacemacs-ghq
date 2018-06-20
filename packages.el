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

(defun ghq/pre-init-magit ()
  (setq magit-repository-directories (list (cons (getenv "GHQ_ROOT") 3))))
