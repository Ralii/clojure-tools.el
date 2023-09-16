;;; clojure-tools.el -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 Lari Saukkonen
;;
;; This file is not part of GNU Emacs.
;;
;;;; Commentary:
;; Small tools related to Clojure/Clojurescript development and debugging
;;
;;
;;; Code:
(require 'cider)

(defcustom render-function-ns ""
  "Render function namespace"
  :group 'clojure-tools
  :type 'string)

(defun clojure-tools-malli-data->schema ()
  "requires malli to be installed"
  (interactive)
  (cider-interactive-eval (format "(require 'malli.provider)
                                   (malli.provider/provide %s)"
                                  (cider-last-sexp))
                          (cider-eval-print-handler)
                          nil
                          (cider--nrepl-pr-request-map)))

(defun clojure-tools-malli-schema->data ()
  "requires malli to be installed"
  (interactive)
  (cider-interactive-eval (format "(require 'malli.generator)
                                   (malli.generator/sample %s {:size 5 :seed 20})"
                                  (cider-last-sexp))
                          (cider-eval-print-handler)
                          nil
                          (cider--nrepl-pr-request-map)))

(defun clojure-tools-force-render! ()
  "Forces render on only evaluated components. Much faster than hot-reload"
  (interactive)
  (cider-interactive-eval render-function-ns
                          nil
                          nil
                          (cider--nrepl-pr-request-map)))

(defun clojure-tools-eval-and-force-render! ()
  "Evaluates function under point and renders it to screen"
  (interactive)
  (cider-eval-defun-at-point)
  (clojure-tools-force-render!))

(defun clojure-tools-inspect-app-db ()
  "Open re-frame global state in cider inspector"
  (interactive)
  (cider-inspect-expr "@re-frame.db/app-db" (cider-current-ns)))

(defun clojure-tools-lr-snitch-clj ()
  "Init snitch (requires snitch)"
  (interactive)
  (cider-interactive-eval "(doseq [ns (all-ns)]
                                (binding [*ns* ns]
                                (require '[snitch.core :refer [defn* *fn *let]])))"
                          nil
                          nil
                          (cider--nrepl-pr-request-map)))

(defun clojure-tools-cycle-defn* ()
  (interactive)
  (save-excursion
    (ignore-errors (forward-char 7))
    (search-backward-regexp "(defn?\\(*\\| ^:private\\)?\\_>")
    (if (match-string 1)
        (replace-match "" nil nil nil 1)
      (goto-char (match-end 0))
      (insert "*"))))

(defun clojure-tools-subscribe-under-point ()
  "Will subscribe reg-sub under point and check it inside inspector"
  (interactive)
  (cider-inspect-expr (format "(do (require 're-frame.core)
                               @(re-frame.core/subscribe [%s]))"
                              (cider-sexp-at-point))
                      (cider-current-ns)))

(provide 'clojure-tools)
;;; clojure-tools.el ends here
