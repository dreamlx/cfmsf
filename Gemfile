source 'http://ruby.taobao.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem "twitter-bootstrap-rails" #界面
  gem 'bootstrap-colorpicker-rails'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'libv8', '3.16.14.3'
  gem 'therubyracer', '0.11.1', :require => 'v8', :platforms => :ruby
  #gem 'execjs'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem "ransack" 
gem 'bootstrap-datepicker-rails'
gem 'acts-as-taggable-on' # tag
gem 'rails_kindeditor', '~> 0.4.0' # rich text
gem 'devise' #用户注册
gem 'cancan' #权限管理
gem 'simple_form' #更好的form help
gem "nested_form"  #嵌套资源form
gem 'state_machine' #状态转换跟踪
gem "less-rails" 
gem "haml-rails" #erb简化模板
gem 'requirejs-rails' #requirejs

gem 'rack-cache', :require => 'rack/cache'
gem 'dragonfly', '~>0.9.15'

gem 'kaminari', '~> 0.14.1' #翻页
gem 'default_value_for', '~> 2.0.1' #model中更好的默认值设定
gem 'qiniu-rs'
gem 'carrierwave'
gem 'carrierwave-qiniu'

gem 'jcrop-rails'
gem 'mini_magick', :git => 'git://github.com/minimagick/minimagick.git', :ref => '6d0f8f953112cce6324a524d76c7e126ee14f392'
gem 'easy_captcha', :github => 'HuberyDu/easy_captcha'  #captcha
gem 'rvm-capistrano'
gem 'capistrano' 
gem 'rails_12factor'
gem 'rubyzip'
# gem 'figaro'
gem 'zip-zip'

group :development, :test do
  gem "pry-nav"
  gem 'pry'
  gem 'sqlite3'
  gem "rspec-rails", "~> 2.14.0"
  gem "factory_girl_rails", "~> 4.2.1"

end

group :development do
  gem 'guard-rspec', '~> 3.0.2'
  gem 'guard-spork', '~> 1.5.1'
  gem 'spork-rails', github: 'sporkrb/spork-rails'
  gem 'rb-fsevent', '~> 0.9.3'
end

group :production do
  #gem 'pg'
  gem 'sqlite3'
end

group :test do
  gem 'capybara', '2.1.0'
  gem "faker", "~> 1.1.2"
  gem "database_cleaner", "~> 1.0.1"
  gem "launchy", "~> 2.3.0"
  gem 'capybara-webkit'
  gem "selenium-webdriver", "~> 2.34.0"
end
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'