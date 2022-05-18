module ApplicationHelper
  def owner?(object)
    current_user == object.user
  end
end
