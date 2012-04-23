module ApplicationHelper
  def user_tags(user)
    tags = []
    tags << content_tag(:span, "student", :class => 'label label-success') if user.is_student
    tags << content_tag(:span, "faculty", :class => 'label label-info') if user.is_faculty
    tags << content_tag(:span, "admin", :class => 'label label-important') if user.is_admin
    tags << content_tag(:span, "secretary", :class => 'label label-warning') if user.is_secretary
    tags.join(' ')
  end

  def boolean_to_check_or_x( attribute )
     content_tag(:i, '', :class => ( attribute ? 'icon-ok' : 'icon-remove' ) ) 
  end
  
  def array_for_select(array)
    value = -1
    {}.tap do |hash|
      array.each do |term|
        hash[term] = value += 1
      end
    end
  end

  def format_summary(summary_string)
    if summary_string.to_s.empty?
      return content_tag(:em, 'no data')
    else
      return summary_string.to_s
    end
  end

  def format_number_summary(number)
    if number.to_s.empty?
      return '0'
    else
      return number.to_s
    end
  end

  def days(report)
    report.season == CourseRequest.seasons[1] ? FacultyCourseRequest.summer_days : FacultyCourseRequest.fall_spring_days
  end
end
