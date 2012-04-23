class Report < ActiveRecord::Base
  has_many :report_users
  has_many :users, :through => :report_users
  belongs_to :user
  belongs_to :course

  validates :year, :presence => true
  validates :season, :presence => true
  validates :user, :presence => true
  
  default_scope :order => 'created_at DESC'

  # this method should be defined in every subclass of report
  after_save(:on => :create) do
    find_requests
  end

  def students
    report_users.map{ |u| u.user if u.request_type == 'CourseRequest' }.compact.uniq
  end

  def student_requests
    report_users.select{ |u| u.request_type == 'CourseRequest' }
  end

  def faculty
    report_users.map{ |u| u.user if u.request_type == 'FacultyCourseRequest' }.compact.uniq
  end

  def faculty_requests
    report_users.select{ |u| u.request_type == 'FacultyCourseRequest' }
  end

  def request_counts(attribute, requests)
    {}.tap do |counts|
      self.send(requests).each do |request|
        value = request.send(attribute)
        counts[value] = (counts[value].nil?) ? 1 : counts[value] += 1
      end
    end
  end

  def most_requested(attribute, requests)
    counts = request_counts(attribute, requests)

    largest = counts.values.sort.last

    result = counts.collect{ |value, count| value if count == largest }.compact
    if attribute == :course
      result = result.map{ |course| course.identifier }
    end
    result.join(', ')
  end

  def count_requests_by_time_and_course(request_type, time, course_id)
    ReportUser.count(:id, :conditions => [ 'request_type = ? AND time = ? AND course_id = ? AND report_id = ?', request_type, time, course_id, id ] )
  end

  def average_rank(request_type)
    ReportUser.average(:rank, :conditions => [ 'request_type = ? AND report_id = ?', request_type, id ] )
  end

  def average_course_rank(request_type, course_id)
    ReportUser.average(:rank, :conditions => [ 'request_type = ? AND course_id = ? AND report_id = ?', request_type, course_id, id ] )
  end
end
