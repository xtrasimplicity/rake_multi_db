require "rails"

module RakeMultiDB
  class Railtie < Rails::Railtie
    rake_tasks do
      load File.join(File.dirname(__FILE__), "../tasks/rake_multi_db.rake")
    end
  end
end

