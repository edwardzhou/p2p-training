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

  def human_status(status_type, status_value)
    t("status.#{status_type}.#{status_value}")
  end

  def human_attr(object, attr_name)
    object.class.human_attribute_name(attr_name)
  end

  def is_dev?
    Rails.env.development?
  end

  def even_odd(index)
    index.even? ? "even" : "odd"
  end


  
end
