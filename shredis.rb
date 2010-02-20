Dir[File.join(File.dirname(__FILE__), "lib", "*")].each { |file| require file }

ROOT_DIR = File.dirname(__FILE__)

configure do
  set :root, ROOT_DIR
  set :public, Proc.new { File.join(root, "public") }
  set :views, Proc.new { File.join(root, "views") }
end

before do
  @status = Shredder.info
end

Dir[File.join(File.dirname(__FILE__), "app", "*")].each { |file| load file }

helpers do
  include Shredis::Helpers
end