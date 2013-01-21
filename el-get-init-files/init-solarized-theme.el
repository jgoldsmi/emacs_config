(setq calendar-location-name "New York, NY")
(setq calendar-latitude 40.7591)
(setq calendar-longitude -73.9844)
(defun load-solarized-light ()
  "Load the solarized light theme."
  (interactive)
  (load-theme 'solarized-light t))
(defun load-solarized-dark ()
  "Load the solarized dark theme."
  (interactive)
  (load-theme 'solarized-dark t))
(require 'theme-changer)
(change-theme 'load-solarized-light 'load-solarized-dark)

