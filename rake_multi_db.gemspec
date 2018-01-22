# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'rake_multi_db/version'

Gem::Specification.new do |spec|
  spec.name          = "rake_multi_db"
  spec.version       = RakeMultiDB::VERSION
  spec.authors       = ["Andrew Walter"]
  spec.email         = "andrew@xtrasimplicity.com"
  spec.summary       = "Simple interactive rake task to automatically drop/migrate/drop & migrate test and development databases"
  spec.homepage      = "http://github.com/xtrasimplicity/rake_all_db_helper"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(LICENSE README.md)
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rails", ">= 3"
end

