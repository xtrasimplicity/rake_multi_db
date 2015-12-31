require 'open3'

namespace :alldb do
  environments = ["test", "development"]

  desc "TODO"
  task drop: :environment do
    environments.each do |env_name|
      drop env_name
    end
  end

  desc "TODO"
  task migrate: :environment do
   environments.each do |env_name|
      migrate env_name
    end


  end

  desc "TODO"
  task redo: :environment do
    environments.each do |env_name|
      drop env_name
      migrate env_name
    end
  end


  def drop(env_name)
    puts "Dropping #{env_name.capitalize} Database"

    execute_command("rake db:drop RAILS_ENV=#{env_name}")
  end

  def migrate(env_name)
    puts "Migrating #{env_name.capitalize} Database"

    execute_command("rake db:migrate RAILS_ENV=#{env_name}")
  end


  def prompt_user(message)
    puts message + " (y|n|yes|no)"

    # Parse the response
    resp = STDIN.gets.strip

    case resp.downcase
      when 'yes', 'y'
        return true
      when 'no', 'n'
        puts "Aborting..."
        exit
      else
        # Re-prompt the user
        return prompt_user message
    end
  end

  def execute_command(command)
    Open3::popen3(command) do |stdin, stdout, stderr|
      out_text = stdout.gets
      error_text = stderr.gets

      unless error_text.nil?
        puts "Error: #{error_text}"

        prompt_user 'An error occurred. Would you like to continue?'
      end

      unless out_text.nil?
        puts out_text
      end
    end
  end
end
