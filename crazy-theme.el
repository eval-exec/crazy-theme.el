;;; crazy-theme.el --- Crazy Theme will add some crazy experience to your coding life -*- lexical-binding: t -*-

;; Copyright (c) 2023 Eval EXEC

;; Author: Eval EXEC <execvy@gmail.com>
;; URL: http://github.com/eval-exec/crazy-theme.el
;; Emacs: GNU Emacs 26.1 or later
;; Version: 1.0.0
;; Package-Requires: ((emacs "26.1"))

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;; The theme will generate random colors on your face
;; Use this theme if you are crazy, haha
;; Everytime you load this theme, you will get different colors.

;; More information: http://github.com/eval-exec/crazy-theme.el

;;; Code:


(deftheme crazy
  "Crazy - Crazy Emacs theme for crazy people.  Everytime you load it, will get different colors.")

(defun crazy-rgb-code(offset limit)
  "Generate random rgb code by OFFSET and LIMIT."
  (list
   (+ offset (random limit))
   (+ offset (random limit))
   (+ offset (random limit))))

(defun crazy-shuffle-list (array)
  (let* ((len (length array))
         (indices (number-sequence 0 (1- len)))
         (shuffled '()))
    (dotimes (_ len)
      (let* ((idx (random (length indices)))
             (element (nth idx array)))
        (setq shuffled (cons element shuffled))
        (setq indices (delete idx indices))))
    shuffled))


(defun crazy-rgb()
  "Generate random rgb color."
  (setq code-tri (crazy-rgb-code 0 256))
  (format "#%02X%02X%02X" (nth 0 code-tri) (nth 1 code-tri)  (nth 2 code-tri)))

(defun crazy-color-light-func-default()
  "Generate random light color."
  (setq code-tri
		(crazy-rgb-code 126 126)
		)
  (format "#%02X%02X%02X" (nth 0 code-tri) (nth 1 code-tri)  (nth 2 code-tri)))

(defun crazy-color-dark-func-default()
  "Generate random dark color."
  (setq code-tri
		  (crazy-rgb-code 0 126))
  (format "#%02X%02X%02X" (nth 0 code-tri) (nth 1 code-tri)  (nth 2 code-tri)))

(defun crazy-color-dark-func-for-background()
  "Generate random dark background color."
  (let (
		(bg0 (random 64))
		(bg1 (random 64))
		(bg2 (random 64))
		)
	(format "#%02X%02X%02X" bg0 bg1 bg2)))

(defun crazy-color-light-func-for-background()
  "Generate random light background color."
  (let (
		(bg0 (+ (random 64) 191))
		(bg1 (+ (random 64) 191))
		(bg2 (+ (random 64) 191))
		)
	(format "#%02X%02X%02X" bg0 bg1 bg2)))


(setq crazy-faces-group-same-background '(
									default
									font-lock-builtin-face
									font-lock-comment-face
									font-lock-comment-delimiter-face
									font-lock-doc-face
									font-lock-function-name-face
									font-lock-keyword-face
									font-lock-preprocessor-face
									font-lock-string-face
									font-lock-type-face
									font-lock-constant-face
									font-lock-variable-name-face
									font-lock-warning-face
									font-lock-negation-char-face

									fringe
									line-number

								 midre-paren-face

								 rainbow-delimiters-depth-1-face
								 rainbow-delimiters-depth-2-face
								 rainbow-delimiters-depth-3-face
								 rainbow-delimiters-depth-4-face
								 rainbow-delimiters-depth-5-face
								 rainbow-delimiters-depth-6-face
								 rainbow-delimiters-depth-7-face
								 rainbow-delimiters-depth-8-face
								 rainbow-delimiters-depth-9-face
								 rainbow-delimiters-depth-10-face
								 rainbow-delimiters-depth-11-face
								 rainbow-delimiters-depth-12-face

									))


(setq crazy-faces-group-others '(

								 success
								 warning
								 error
								 link
								 link-visited
								 highlight
								 hl-line
								 header-line
								 vertical-border
								 secondary-selection
								 query-replace
								 minibuffer-prompt
								 tooltip
								 mode-line
								 mode-line-buffer-id
								 mode-line-emphasis
								 mode-line-inactive
								 window-divider
								 window-divider-first-pixel
								 window-divider-last-pixel
								 custom-state
								 ido-first-match
								 ido-only-match
								 ido-subdir
								 ido-virtual
								 ace-jump-face-background
								 ace-jump-face-foreground
								 aw-background-face
								 aw-leading-char-face
								 centaur-tabs-default
								 centaur-tabs-selected
								 centaur-tabs-unselected
								 centaur-tabs-selected-modified
								 centaur-tabs-unselected-modified
								 centaur-tabs-active-bar-face
								 centaur-tabs-modified-marker-selected
								 centaur-tabs-modified-marker-unselected
								 company-tooltip
								 company-tooltip-annotation
								 company-tooltip-annotation-selection
								 company-tooltip-selection
								 company-tooltip-mouse
								 company-tooltip-common
								 company-tooltip-common-selection
								 company-preview
								 company-preview-common
								 company-scrollbar-fg
								 company-scrollbar-bg
								 company-template-field
								 doom-modeline-bar
								 flyspell-duplicate
								 flyspell-incorrect
								 flymake-error
								 flymake-note
								 flymake-warning
								 flycheck-error
								 flycheck-info
								 flycheck-warning
								 compilation-face
								 compilation-line-number
								 compilation-column-number
								 compilation-mode-line-exit
								 compilation-mode-line-fail
								 isearch
								 isearch-fail
								 lazy-highlight
								 diff-hl-change
								 diff-hl-delete
								 diff-hl-insert
								 dired-directory
								 dired-flagged
								 dired-symlink
								 dired-async-failures
								 dired-async-message
								 dired-async-mode-message
								 helm-header
								 helm-source-header
								 helm-selection
								 helm-selection-line
								 helm-visible-mark
								 helm-candidate-number
								 helm-separator
								 helm-M-x-key
								 helm-bookmark-addressbook
								 helm-bookmark-directory
								 helm-bookmark-file
								 helm-bookmark-gnus
								 helm-bookmark-info
								 helm-bookmark-man
								 helm-bookmark-w3m
								 helm-match
								 helm-ff-directory
								 helm-ff-file
								 helm-ff-executable
								 helm-ff-invalid-symlink
								 helm-ff-symlink
								 helm-ff-prefix
								 helm-buffer-not-saved
								 helm-buffer-process
								 helm-buffer-saved-out
								 helm-buffer-size
								 helm-buffer-directory
								 helm-grep-cmd-line
								 helm-grep-file
								 helm-grep-finish
								 helm-grep-lineno
								 helm-grep-finish
								 helm-grep-match
								 helm-swoop-target-line-block-face
								 helm-swoop-target-line-face
								 helm-swoop-target-word-face
								 helm-locate-finish
								 info-menu-star
								 ivy-confirm-face
								 ivy-current-match
								 ivy-highlight-face
								 ivy-match-required-face
								 ivy-minibuffer-match-face-1
								 ivy-minibuffer-match-face-2
								 ivy-minibuffer-match-face-3
								 ivy-minibuffer-match-face-4
								 ivy-minibuffer-match-highlight
								 ivy-modified-buffer
								 ivy-virtual
								 counsel-key-binding
								 swiper-match-face-1
								 swiper-match-face-2
								 swiper-match-face-3
								 swiper-match-face-4
								 git-commit-comment-action
								 git-commit-comment-branch
								 git-commit-comment-heading
								 git-gutter:added
								 git-gutter:deleted
								 git-gutter:modified
								 eshell-ls-archive
								 eshell-ls-backup
								 eshell-ls-clutter
								 eshell-ls-directory
								 eshell-ls-executable
								 eshell-ls-missing
								 eshell-ls-product
								 eshell-ls-special
								 eshell-ls-symlink
								 eshell-ls-unreadable
								 eshell-prompt
								 Man-overstrike
								 Man-underline
								 woman-bold
								 woman-italic
								 dictionary-button-face
								 dictionary-reference-face
								 dictionary-word-entry-face
								 erc-error-face
								 erc-input-face
								 erc-my-nick-face
								 erc-notice-face
								 erc-timestamp-face
								 jabber-roster-user-online
								 jabber-roster-user-away
								 jabber-roster-user-xa
								 jabber-roster-user-dnd
								 jabber-roster-user-chatty
								 jabber-roster-user-error
								 jabber-roster-user-offline
								 jabber-chat-prompt-local
								 jabber-chat-prompt-foreign
								 jabber-chat-prompt-system
								 jabber-chat-error
								 jabber-rare-time-face
								 jabber-activity-face
								 jabber-activity-personal-face
								 eww-form-checkbox
								 eww-form-file
								 eww-form-select
								 eww-form-submit
								 eww-form-text
								 eww-form-textarea
								 eww-invalid-certificate
								 eww-valid-certificate
								 js2-error
								 js2-external-variable
								 js2-warning
								 js2-function-call
								 js2-function-param
								 js2-jsdoc-tag
								 js2-jsdoc-type
								 js2-jsdoc-value
								 js2-object-property
								 ediff-fine-diff-Ancestor
								 ediff-fine-diff-A
								 ediff-fine-diff-B
								 ediff-fine-diff-C
								 ediff-current-diff-Ancestor
								 ediff-current-diff-A
								 ediff-current-diff-B
								 ediff-current-diff-C
								 ediff-even-diff-Ancestor
								 ediff-even-diff-A
								 ediff-even-diff-B
								 ediff-even-diff-C
								 ediff-odd-diff-Ancestor
								 ediff-odd-diff-A
								 ediff-odd-diff-B
								 ediff-odd-diff-C
								 magit-section-highlight
								 magit-section-heading
								 magit-section-heading-selection
								 magit-diff-file-heading
								 magit-diff-file-heading-highlight
								 magit-diff-file-heading-selection
								 magit-diff-hunk-heading
								 magit-diff-hunk-heading-highlight
								 magit-diff-hunk-heading-selection
								 magit-diff-context
								 magit-diff-context-highlight
								 magit-diffstat-added
								 magit-diffstat-removed
								 magit-process-ok
								 magit-process-ng
								 magit-log-author
								 magit-log-date
								 magit-log-graph
								 magit-sequence-pick
								 magit-sequence-stop
								 magit-sequence-part
								 magit-sequence-head
								 magit-sequence-drop
								 magit-sequence-done
								 magit-sequence-onto
								 magit-bisect-good
								 magit-bisect-skip
								 magit-bisect-bad
								 magit-blame-heading
								 magit-blame-hash
								 magit-blame-name
								 magit-blame-date
								 magit-blame-summary
								 magit-dimmed
								 magit-hash
								 magit-tag
								 magit-branch-remote
								 magit-branch-local
								 magit-branch-current
								 magit-head
								 magit-refname
								 magit-refname-stash
								 magit-refname-wip
								 magit-signature-good
								 magit-signature-bad
								 magit-signature-untrusted
								 magit-cherry-unmatched
								 magit-cherry-equivalent
								 magit-reflog-commit
								 magit-reflog-amend
								 magit-reflog-merge
								 magit-reflog-checkout
								 magit-reflog-reset
								 magit-reflog-rebase
								 magit-reflog-cherry-pick
								 magit-reflog-remote
								 magit-reflog-other
								 message-cited-text
								 message-header-cc
								 message-header-name
								 message-header-newsgroups
								 message-header-other
								 message-header-subject
								 message-header-to
								 message-header-xheader
								 message-mml
								 message-separator
								 epa-field-body
								 epa-field-name
								 notmuch-crypto-decryption
								 notmuch-crypto-signature-bad
								 notmuch-crypto-signature-good
								 notmuch-crypto-signature-good-key
								 notmuch-crypto-signature-unknown
								 notmuch-hello-logo-background
								 notmuch-message-summary-face
								 notmuch-search-count
								 notmuch-search-date
								 notmuch-search-matching-authors
								 notmuch-search-non-matching-authors
								 notmuch-tag-added
								 notmuch-tag-deleted
								 notmuch-tag-face
								 notmuch-tag-unread
								 notmuch-tree-match-author-face
								 notmuch-tree-match-date-face
								 notmuch-tree-match-face
								 notmuch-tree-match-tag-face
								 notmuch-tree-no-match-face
								 elfeed-log-debug-level-face
								 elfeed-log-error-level-face
								 elfeed-log-info-level-face
								 elfeed-log-warn-level-face
								 elfeed-search-date-face
								 elfeed-search-feed-face
								 elfeed-search-tag-face
								 elfeed-search-title-face
								 elfeed-search-unread-count-face
								 persp-selected-face
								 powerline-active1
								 powerline-active2
								 powerline-inactive1
								 powerline-inactive2

								 rainbow-delimiters-unmatched-face
								 rbenv-active-ruby-face
								 elixir-crazy-face
								 elixir-attribute-face
								 show-paren-match
								 show-paren-mismatch
								 sh-heredoc
								 cider-fringe-good-face
								 sly-error-face
								 sly-mrepl-note-face
								 sly-mrepl-output-face
								 sly-mrepl-prompt-face
								 sly-note-face
								 sly-style-warning-face
								 sly-warning-face
								 sp-show-pair-mismatch-face
								 lispy-face-hint
								 lispyville-special-face
								 spaceline-flycheck-error
								 spaceline-flycheck-info
								 spaceline-flycheck-warning
								 spaceline-python-venv
								 solaire-default-face
								 solaire-minibuffer-face
								 web-mode-doctype-face
								 web-mode-error-face
								 web-mode-html-attr-equal-face
								 web-mode-html-attr-name-face
								 web-mode-html-tag-bracket-face
								 web-mode-html-tag-face
								 web-mode-symbol-face
								 nxml-attribute-local-name
								 nxml-element-local-name
								 nxml-markup-declaration-delimiter
								 nxml-processing-instruction-delimiter
								 flx-highlight-face
								 rpm-spec-tag-face
								 rpm-spec-obsolete-tag-face
								 rpm-spec-macro-face
								 rpm-spec-var-face
								 rpm-spec-doc-face
								 rpm-spec-dir-face
								 rpm-spec-package-face
								 rpm-spec-ghost-face
								 rpm-spec-section-face
								 guix-true
								 guix-build-log-phase-end
								 guix-build-log-phase-start
								 gomoku-O
								 gomoku-X
								 tabbar-default
								 tabbar-highlight
								 tabbar-button
								 tabbar-button-highlight
								 tabbar-modified
								 tabbar-unselected
								 tabbar-unselected-modified
								 tabbar-selected
								 tabbar-selected-modified
								 linum
								 linum-highlight-face
								 line-number-current-line
								 reb-match-0
								 reb-match-1
								 reb-match-2
								 reb-match-3
								 desktop-entry-deprecated-keyword-face
								 desktop-entry-group-header-face
								 desktop-entry-locale-face
								 desktop-entry-unknown-keyword-face
								 desktop-entry-value-face
								 font-latex-sectioning-0-face
								 font-latex-sectioning-1-face
								 font-latex-sectioning-2-face
								 font-latex-sectioning-3-face
								 font-latex-sectioning-4-face
								 font-latex-sectioning-5-face
								 font-latex-bold-face
								 font-latex-italic-face
								 font-latex-warning-face
								 font-latex-doctex-preprocessor-face
								 font-latex-script-char-face
								 org-date
								 org-document-info
								 org-document-info-keyword
								 org-document-title
								 org-footnote
								 org-sexp-date
								 diary
								 holiday
								 breakpoint-disabled
								 breakpoint-enabled
								 realgud-overlay-arrow1
								 realgud-overlay-arrow3
								 realgud-bp-enabled-face
								 realgud-bp-disabled-face
								 realgud-bp-line-enabled-face
								 realgud-bp-line-disabled-face
								 realgud-line-number
								 realgud-backtrace-number
								 rmsbolt-current-line-face
								 ruler-mode-column-number
								 ruler-mode-comment-column
								 ruler-mode-current-column
								 ruler-mode-default
								 ruler-mode-fill-column
								 ruler-mode-fringes
								 ruler-mode-goal-column
								 ruler-mode-margins
								 ruler-mode-tab-stop
								 undo-tree-visualizer-current-face
								 undo-tree-visualizer-register-face
								 undo-tree-visualizer-unmodified-face
								 tab-bar-tab-inactive
								 tab-bar-tab
								 tab-bar
								 ))

(setq crazy-faces-group-reverse '(cursor region ))



(defcustom crazy-theme-prefer-dark t
  "If non-nil, prefer dark colors when available."
  :type 'boolean
  :group 'crazy)

(setq crazy-foreground-func
	  (if crazy-theme-prefer-dark
		  'crazy-color-light-func-default
		'crazy-color-dark-func-default
		))
(setq crazy-background-func
	  (if crazy-theme-prefer-dark
		  'crazy-color-dark-func-default
		'crazy-color-light-func-default
	  ))

(setq crazy-background-default
	  (if crazy-theme-prefer-dark
		  (funcall 'crazy-color-dark-func-for-background)
		(funcall 'crazy-color-light-func-for-background)
		  ))

(mapcar (lambda(face)
		  (custom-theme-set-faces
		   'crazy
		   `(,face ((t (:foreground ,(funcall crazy-foreground-func) :background ,(funcall crazy-background-func))))))
		  )
 crazy-faces-group-others)

(mapcar (lambda(face)
 (custom-theme-set-faces
  'crazy
  `(,face ((t (:foreground ,(funcall crazy-foreground-func) :background ,crazy-background-default)))))
		  )
 crazy-faces-group-same-background)


(mapcar (lambda(face)
		  (custom-theme-set-faces
		   'crazy
		   `(,face ((t (:foreground ,(funcall crazy-background-func) :background ,(funcall crazy-foreground-func))))))
		  )
 crazy-faces-group-reverse)



(custom-theme-set-variables
 'crazy
 `(ansi-color-names-vector
   [
	(crazy-rgb)
	(crazy-rgb)
	(crazy-rgb)
	(crazy-rgb)
	(crazy-rgb)
	(crazy-rgb)
	(crazy-rgb)
	(crazy-rgb)
	]))

(provide-theme 'crazy)


;;;###autoload
(and load-file-name
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide 'crazy-theme)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; crazy-theme.el ends here
