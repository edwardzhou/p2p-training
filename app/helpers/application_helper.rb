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
        t("label.company.size.less_50") => :"1",
        t("label.company.size.less_100") => :"2",
        t("label.company.size.less_200") => :"3",
        t("label.company.size.less_300") => :"4",
        t("label.company.size.more_than_300") => :"5",
    }
  end
end
