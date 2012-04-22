class ReportUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :report
  belongs_to :course
end
