# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )
  config.load_paths += %W(#{RAILS_ROOT}/app/jobs)

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "aws-s3", :lib => "aws/s3"
  # config.gem "tinder", :lib => false
  config.gem 'warden',                    :version => '>= 0.9.4'
  config.gem 'devise',                    :version => '>= 1.0.3'
  config.gem 'chronic',                   :version => '>= 0.2.3'
  config.gem 'delayed_job',               :version => '2.0.2'
  config.gem 'will_paginate',             :version => '>= 2.3.11',  :lib => 'will_paginate'
  config.gem 'paperclip',                 :version => '>= 2.2.9',   :lib => 'paperclip'
  config.gem 'whenever',                  :version => '>= 0.3.7',   :lib => false
  config.gem 'friendly_id'
  config.gem 'newrelic_rpm'
  config.gem 'hoptoad_notifier'
  config.gem 'liquid'
  config.gem 'haml',                      :version => '>= 2.2.0'
  config.gem 'compass',                   :version => '>= 0.8.5'
  config.gem 'grid-coordinates',          :version => '>= 1.0.3',   :lib => 'compass'
  config.gem 'formtastic'
  config.gem 'validation_reflection', 	  :version => '0.3.8'

  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  config.active_record.observers = :user_observer, :invite_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de
  config.action_mailer.default_url_options = { :host => "broth.local" }
  
end
