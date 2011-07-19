AlipayConfig = YAML.load_file(Rails.root.join("config/alipay.yml"))[Rails.env]["alipay"].symbolize_keys

ActiveMerchant::Billing::Integrations::Alipay::KEY = AlipayConfig[:key]

require 'active_merchant'
require 'active_merchant/billing/integrations/action_view_helper'

ActionView::Base.send(:include, ActiveMerchant::Billing::Integrations::ActionViewHelper)

# patch for ActiveMerchant::Billing::Integrations::Alipay::Notification.parse
module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Alipay
        class Notification
          alias_method :old_parse, :parse
          def parse(post)
            @raw = post
            for line in post.split('&')
              key, value = *line.scan( %r{^(\w+)\=(.*)$} ).flatten
              params[key] = CGI.unescape(value || '')
            end
          end
        end
      end
    end
  end
end