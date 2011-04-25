module ApplicationHelper
  def show_msg(model_errors = nil)
    if !model_errors.nil? && model_errors.any? then
      render "common/model_errors", :errors => model_errors
    else
      render "common/show_msg"
    end
  end
end
