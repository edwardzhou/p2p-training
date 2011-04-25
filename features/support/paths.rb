#encoding: utf-8

module NavigationHelpers

  def get_catalog_path_by_name(catalog_name)
    catalog = Catalog.find_by_name(catalog_name)
    catalog_path(catalog)
  end

  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

      when /the home\s?page/
        '/'

      # Add more mappings here.
      # Here is an example that pulls values out of the Regexp:
      #
      #   when /^(.*)'s profile page$/i
      #     user_profile_path(User.find_by_login($1))
      when /(主页|首页)/
        '/'

      when /(login page)|(登录页面)/
        new_user_session_path

      when /目录\(([^\)]*)\)/
        get_catalog_path_by_name($1)

      when /目录管理页面/
        admin_catalogs_path

      when /新增目录页面/
        new_admin_catalog_path

      else
        begin
          page_name =~ /the (.*) page/
          path_components = $1.split(/\s+/)
          self.send(path_components.push('path').join('_').to_sym)
        rescue Object => e
          raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                    "Now, go and add a mapping in #{__FILE__}"
        end
    end
  end
end

World(NavigationHelpers)
