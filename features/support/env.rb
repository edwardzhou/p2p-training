ENV["RAILS_ENV"] = "test"

require 'rubygems'
require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.

  require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

  require 'cucumber/formatter/unicode' # Remove this line if you don't want Cucumber Unicode support
  require 'cucumber/rails/rspec'
  require 'cucumber/rails/world'
  require 'cucumber/rails/active_record'
  require 'cucumber/web/tableish'

  require 'webrat'
  require 'webrat/core/matchers'

  Webrat.configure do |config|
    config.mode = :rails
    config.open_error_files = false # Set to true if you want error pages to pop up in the browser
  end


  # If you set this to false, any error raised from within your app will bubble
  # up to your step definition and out to cucumber unless you catch it somewhere
  # on the way. You can make Rails rescue errors and render error pages on a
  # per-scenario basis by tagging a scenario or feature with the @allow-rescue tag.
  #
  # If you set this to true, Rails will rescue all errors and render error
  # pages, more or less in the same way your application would behave in the
  # default production environment. It's not recommended to do this for all
  # of your scenarios, as this makes it hard to discover errors in your application.
  ActionController::Base.allow_rescue = false

  # If you set this to true, each scenario will run in a database transaction.
  # You can still turn off transactions on a per-scenario basis, simply tagging
  # a feature or scenario with the @no-txn tag. If you are using Capybara,
  # tagging with @culerity or @javascript will also turn transactions off.
  #
  # If you set this to false, transactions will be off for all scenarios,
  # regardless of whether you use @no-txn or not.
  #
  # Beware that turning transactions off will leave data in your database
  # after each scenario, which can lead to hard-to-debug failures in
  # subsequent scenarios. If you do this, we recommend you create a Before
  # block that will explicitly put your database in a known state.
  Cucumber::Rails::World.use_transactional_fixtures = true
  # How to clean your database when transactions are turned off. See
  # http://github.com/bmabey/database_cleaner for more info.
  if defined?(ActiveRecord::Base)
    begin
      require 'database_cleaner'
      DatabaseCleaner.strategy = :truncation
    rescue LoadError => ignore_if_database_cleaner_not_present
    end
  end


end

Spork.each_run do
  # This code will be run each time you run your specs.

end

# --- Instructions ---
# Sort the contents of this file into a Spork.prefork and a Spork.each_run
# block.
#
# The Spork.prefork block is run only once when the spork server is started.
# You typically want to place most of your (slow) initializer code in here, in
# particular, require'ing any 3rd-party gems that you don't normally modify
# during development.
#
# The Spork.each_run block is run each time you run your specs.  In case you
# need to load files that tend to change during development, require them here.
# With Rails, your application modules are loaded automatically, so sometimes
# this block can remain empty.
#
# Note: You can modify files loaded *from* the Spork.each_run block without
# restarting the spork server.  However, this file itself will not be reloaded,
# so if you change any of the code inside the each_run block, you still need to
# restart the server.  In general, if you have non-trivial code in this file,
# it's advisable to move it into a separate file so you can easily edit it
# without restarting spork.  (For example, with RSpec, you could move
# non-trivial code into a file spec/support/my_helper.rb, making sure that the
# spec/support/* files are require'd from inside the each_run block.)
#
# Any code that is left outside the two blocks will be run during preforking
# *and* during each_run -- that's probably not what you want.
#
# These instructions should self-destruct in 10 seconds.  If they don't, feel
# free to delete them.




# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a 
# newer version of cucumber-rails. Consider adding your own code to a new file 
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.

