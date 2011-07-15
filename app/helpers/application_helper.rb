module ApplicationHelper
  def show_msg(model_errors = nil)
    if !model_errors.nil? && model_errors.any? then
      render "common/model_errors", :errors => model_errors
    else
      render "common/show_msg"
    end
  end

  def company_size_options
    {
        t("label.company.size.less_50") => :"less_50",
        t("label.company.size.less_100") => :"less_100",
        t("label.company.size.less_200") => :"less_200",
        t("label.company.size.less_300") => :"less_300",
        t("label.company.size.more_than_300") => :"more_than_300",
    }
  end

    # @param count [Object]
  def latest_courses(count=5)
    Course.active_courses.order('created_at DESC').limit(count)
  end
  
end
