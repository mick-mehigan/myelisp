(defun ros_round(mon_val)
  "Round a value to two decimal places according to ROS rules."
  (/ (float (ceiling (* 100 mon_val))) 100)
  )

(defun weekly_threshold(week yearly_val)
  "Work out weekly thresholds, given the week-number and the yearly threshold"
  (* week (ros_round (/ yearly_val 52)))
  )

(defun paye(per std cred paytd taxtd paytp)
  "Calculate PAYE for a given pay period"
  (interactive "nPeriod: \nnStandard Cut Off: \nnTax Credits: \nnPay To Date: \nnTax To Date: \nnGross Pay TP: \n")

  (setq w_std (weekly_threshold per std))
  (setq w_cred (weekly_threshold per cred))
  (setq pay (+ paytd paytp))
  (setq pay_lower (min w_std  pay))
  (setq pay_upper (- (max w_std pay) w_std))
  (insert (number-to-string (ros_round (- (- (+ (* pay_lower 0.20) (* pay_upper 0.41)) w_cred) taxtd))))
  )

(defun prsi_ee(paytp, prsi_class)
  "Calculate Employee(EE) PRSI for a pay period"
  )

(defun prsi_er(paytp, prsi_class)
  "Calculate Employer(ER) PRSI for a pay period"
  )

(defun usc(per paytd usctd paytp)
  "Calculate EE PRSI for a pay period"
  )
