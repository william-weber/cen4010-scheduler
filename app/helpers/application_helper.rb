module ApplicationHelper
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
