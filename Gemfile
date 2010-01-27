source "http://gems.github.com"
source "http://gemcutter.org"

bundle_path "vendor/gems"

gem "sinatra", "0.9.4"
gem "rack", "1.1"

gem "redis", "0.1.1"

only :test do
  gem "cucumber", "0.6.1"
  gem "rack-test", "0.5.3", :require_as => "rack/test"
  gem "rspec", "1.3.0"
  gem "test-unit", "1.2.3"
  gem "webrat", "0.6.0"
end

disable_system_gems