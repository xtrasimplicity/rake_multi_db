require 'open3'

namespace :multi_db do
 environments = ENV['environments'].nil? ? ['test', 'development'] : ENV['environments'].split(',')

 desc "Drops all specified environment databases"
  task :drop do
    environments.each do |env_name|
      drop env_name
    end
  end

  desc "Migrates all specified environment databases"
  task :migrate do
   environments.each do |env_name|
      migrate env_name
    end
  end

  desc "Drops and then Migrates all specified environment databases"
  task :redo do
    environments.each do |env_name|
      drop env_name
      migrate env_name
    end
  end

  desc "Resets all table data in the specified environment databases"
  task :reset do
    environments.each do |env_name|
      reset env_name
    end
  end
 


 # Helper methods #
 def prompt_user(message)
  # Don't show a message, if the force param was passed
  force = ENV['force'].nil? ? false : ENV['force'] 

  return true if force

  puts "#{message} (y|n|yes|no)"
  
  # parse the response
  resp = STDIN.gets.strip

  case resp.downcase
   when 'yes', 'y'
    return true
   when 'no', 'n'
    puts 'Aborting...'
    exit 0
   else
    # Re-prompt the user
    return prompt_user message
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

  def reset(env_name)
    puts "Resetting #{env_name.capitalize} Database"

    execute_command("rake db:reset RAILS_ENV=#{env_name}")
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
