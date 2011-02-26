# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "active_record_to_csv/version"

Gem::Specification.new do |s|
  s.name        = "active_record_to_csv"
  s.version     = ActiveRecordToCsv::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jared Ning"]
  s.email       = ["jared@redningja.com"]
  s.homepage    = "https://github.com/ordinaryzelig/active_record_to_csv"
  s.summary     = %q{Simple ActiveRecordModel#to_csv class method that preserves scopes}
  s.description = %q{Simple ActiveRecordModel#to_csv class method that preserves scopes}

  s.rubyforge_project = "active_record_to_csv"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'activerecord', '>= 3.0.0'

  s.add_development_dependency 'rspec', '2.5.0'
  s.add_development_dependency 'sqlite3-ruby', '1.2.5'
end
