require 'pathname'
require 'active_record'

require File.join(Pathname(__FILE__).dirname.expand_path, '../lib/active_record_to_csv')

# load schema.
require 'schema'

# require support .rb files.
Dir[File.expand_path("../support/**/*.rb", __FILE__)].each {|f| require f}

RSpec.configure do |config|
  config.include Macros
end
