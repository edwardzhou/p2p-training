module UrlHelper
  def set_mailer_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
end