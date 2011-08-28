module AccessHelper
  
  def checkmark(choice, value_if_true, value_if_false)
    if choice
      return value_if_true.to_s.html_safe
    else
      return value_if_false.to_s.html_safe
    end
  end
end
