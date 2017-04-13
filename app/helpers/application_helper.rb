module ApplicationHelper
  def controller?(*controller)
    controller.to_s.include?(params[:controller])
  end

  def action?(*action)
    action.to_s.include?(params[:action])
  end
end
