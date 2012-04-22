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
end
