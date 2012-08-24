(defun rspec-describe(describe_s)
  "Insert a describe block into the current buffer at the current point."
  (interactive "sWhat are you describing: ")
  (insert (format "  describe \"%s\" do\n  end # </ describe \"%s\" >" describe_s describe_s))
  )

(defun ruby-copyright(year)
  "Place copyright notice at the top of a ruby file."
  (interactive "dWhat year is it?: ")
  (insert (format "# -*- encoding : utf-8 -*-
#
#--
# Copyright (c) Sage (Hibernia) Limited %d. All rights reserved.
# This code may not be copied or used, except as set out in a written licence
# agreement between the user and Sage (Hibernia) Limited, which specifically
# permits the user to use this code.
# Please contact sage.legal@sage.com if you do not have such a licence.
# Sage will take appropriate legal action against those who make unauthorised
# use of this code.
#++
#\n" year))
  )


(defun rspec-helper()
  (interactive)
  (insert "require 'spec_helper'\n")
  )

(defun rspec-test-cases()
  (interactive)
  (insert "[
{:context => \"\", :exp_res => nil},
].each_with_index do |test_data, index|
  context \"when #{test_data[:context]}\" do
    before :each do
    end
    it{}
  end # </ context \"when #{test_data[:context]}\" >
end # </ ].each_with_index >\n")
  )

(defun rspec-date-to-s(key)
  (interactive "sWhat test_data key?: ")
  (insert (format "Payroll::PayrollSystem.s_to_date(test_data[:%s])" key))
  )
