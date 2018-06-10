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
     ghq
     helm-ghq
     magit))

(setq ghq-excluded-packages '())

(defun ghq/init-ghq ()
  (use-package ghq
    :defer t
    :init
    (spacemacs/copy-env-list '("GHQ_ROOT"))))

(defun ghq/init-helm-ghq ()
  (use-package helm-ghq
    :defer t
    :init
    (custom-set-variables
      '(helm-ghq-command-ghq-arg-list '("list"))
      '(helm-ghq-command-git-arg-ls-files '("ls-files" "-co" "--exclude-standard" "--")))))

(defun ghq/pre-init-magit ()
  (setq-default magit-repository-directories t)
  (with-eval-after-load 'magit-repos
    (defun magit-list-repos ()
      (require 'ghq)
      (ghq--find-projects-full-path))))
