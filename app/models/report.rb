class Report < ActiveRecord::Base
  has_many :report_users
  has_many :users, :through => :report_users
  belongs_to :user
  belongs_to :course

  validates :year, :presence => true
  validates :season, :presence => true
  validates :user, :presence => true
  
  # this method should be defined in every subclass of report
  after_save(:on => :create) do
    find_requests
  end

  def students
    report_users.map{ |u| u.user if u.user.is_student }.compact.uniq
  end

  def student_requests
    report_users.select{ |u| u.user.is_student }
  end

  def faculty
    report_users.map{ |u| u.user if u.user.is_faculty }.compact.uniq
  end

  def faculty_requests
    report_users.select{ |u| u.user.is_faculty }
  end
end
