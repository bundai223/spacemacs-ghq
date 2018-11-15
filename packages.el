;;; packages.el - ghq layer file for Spacemacs
;;
;; Copyright (c) 2018 Seong Yong-ju
;;
;; Author: Seong Yong-ju <sei40kr@gmail.com>
;;
;; This file is not part of GNU Emacs
;;
;;; License: GPLv3

(setq ghq-packages '(ghq
                     magit))

(defun ghq/init-ghq ()
  (use-package ghq
    :defer t))

(defun ghq/post-init-magit ()
  (eval-after-load 'magit-repos
    '(add-to-list 'magit-repository-directories
                  (cons (or (getenv "GHQ_ROOT") "~/.ghq") 3) t)))
