(use-package lua-mode :ensure t
  :mode "\\.lua\\'"
  :interpreter "lua"
  :init
  (progn
    (define-minor-mode love-mode
      "Buffer local minor mode for evil-org"
      :init-value nil
      :lighter " <3"
      :keymap (make-sparse-keymap) ; defines love-mode-map
      :group lua)

    (define-key love-mode-map (kbd "s-b")
      (λ (shell-command (concat "open -a love.app " default-directory))))

    (add-hook 'lua-mode-hook
        (lambda()
          (if (string-match "\\.love/.+\\.lua\\'" (buffer-file-name))
              (love-mode t))

          (nmap lua-mode-map (kbd "s-r")
                (lambda() (interactive) (shell-command-on-region (point-min) (point-max) "lua")))
          (vmap lua-mode-map (kbd "s-r")
                (lambda() (interactive) (shell-command-on-region (region-beginning) (region-end) "lua")))
          ))))

;;
(provide 'mod-love)
