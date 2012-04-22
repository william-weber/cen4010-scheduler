class FacultyCourseRequest < CourseRequest
  validates :course_preference_rank, :presence => true, :inclusion => { :in => (1..3) }
  validates :days_of_week_rank, :presence => true, :inclusion => { :in => (1..3) }
  validates :times_of_day_rank, :presence => true, :inclusion => { :in => (1..3) }
  validates :morning_rank, :presence => true, :inclusion => { :in => (1..3) }
  validates :afternoon_rank, :presence => true, :inclusion => { :in => (1..3) }
  validates :evening_rank, :presence => true, :inclusion => { :in => (1..3) }

  def self.summer_days
    [ 'MW', 'TR', 'MTWR', 'MWF', 'MW + 4 Fridays', 'TR + 4 Fridays' ]
  end

  def self.fall_spring_days
    [ 'MWF', 'MW', 'TR' ]
  end

  def self.summer_terms
    [ 'Summer C', 'Summer A', 'Summer B', '8 week', '12 week' ]
  end

  validates :summer_term_preference, :presence => true, :inclusion => { :in => (0..self.summer_terms.length-1), :message => 
   'must be a valid term preference for summer' }, :if => :for_summer?

  validates :days_of_week_preference, :presence => true
  validates :days_of_week_preference, :inclusion => { :in => (0..self.fall_spring_days.length-1),
    :message => 'must be valid days for fall/spring' }, :unless => :for_summer?
  validates :days_of_week_preference, :inclusion => { :in => (0..self.summer_days.length-1),
    :message => 'must be valid days for summer' }, :if => :for_summer?

  validate :summer_requests_cannot_have_release_sabbatical_or_dev_leave
  validate :non_summer_requests_cannot_have_summer_term_preference
  validate :uniqueness_of_rank_selections

  def for_summer?
    season == CourseRequest.seasons[1]
  end
  
  def summer_requests_cannot_have_release_sabbatical_or_dev_leave
    if season == CourseRequest.seasons[1]
      if course_release_expected
        errors.add :course_release_expected, "can't be marked for summer term"
      end
      if sabbatical_expected
        errors.add :sabbatical_expected, "can't be marked for summer term"
      end
      if dev_leave_expected
        errors.add :dev_leave_expected, "can't be marked for summer term"
      end
    end
  end
  
  def non_summer_requests_cannot_have_summer_term_preference
    unless for_summer? or summer_term_preference.nil?
      errors.add :summer_term_preference, 'cannot be set for non-summer term'
    end
  end

  def uniqueness_of_rank_selections
    unless [ course_preference_rank, days_of_week_rank, times_of_day_rank ].uniq.length == 3
      errors.add :course_preference_rank, 'must be unique rank selections'
      errors.add :days_of_week_rank, 'must be unique rank selections'
      errors.add :times_of_day_rank, 'must be unique rank selections'
    end

    unless [ morning_rank, afternoon_rank, evening_rank ].uniq.length == 3
      errors.add :morning_rank, 'must be unique rank selections'
      errors.add :afternoon_rank, 'must be unique rank selections'
      errors.add :evening_rank, 'must be unique rank selections'
    end
  end
end
