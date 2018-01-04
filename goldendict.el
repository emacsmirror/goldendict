;;; goldendict.el --- query word smartly with goldendict.el

;; Authors: stardiviner <numbchild@gmail.com>
;; Package-Requires: ((emacs "24.4") (cl-lib "0.5"))
;; Package-Version: 0.1
;; Keywords: dict goldendict
;; homepage: https://github.com/stardiviner/goldendict.el

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; query word smartly with goldendict.el


;;; Code:


(defgroup goldendict nil
  "Use goldendict in Emacs."
  :prefix "goldendict-"
  :group 'dictionary)

(defcustom goldendict-cmd "goldendict"
  "Specify Goldendict command."
  :type 'string
  :group 'goldendict)

(defun goldendict-dwim ()
  "Query current symbol/word at point or region selected with Goldendict."
  (interactive)
  (let ((word (downcase
               (substring-no-properties
                (if (region-active-p)
                    (buffer-substring-no-properties (mark) (point))
                  ;; way: get word with `thing-at-point'
                  (thing-at-point 'word))))))
    (save-excursion
      ;; pass the selection to shell command goldendict.
      ;; use Goldendict API: "Scan Popup"
      (shell-command (concat goldendict-cmd " " (shell-quote-argument word))))))



(provide 'goldendict)

;;; goldendict.el ends here