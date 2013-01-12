require "bundler/gem_tasks"

namespace :mdp do
  desc 'setup devise example migrating db and creating a default user'
  task :clean do
    ['d.txt'].each{|x|
       File.delete(x);        
    }              
  end
  
  desc 'setup devise example migrating db and creating a default user'
  task :setup => ['db:drop', 'db:create', 'db:migrate', 'environment'] do
    user = User.create! do |u|
      u.email = 'user@test.com'
      u.password = 'user123'
      u.password_confirmation = 'user123'
      u.ensure_authentication_token!
    end
    user.confirm!
    puts 'New user created!'
    puts 'Email   : ' << user.email
    puts 'Password: ' << user.password

    admin = Admin.create! do |u|
      u.email = 'admin@test.com'
      u.password = 'admin123'
      u.password_confirmation = 'admin123'
    end
    #admin.confirm!
    puts 'New admin created!'
    puts 'Email   : ' << admin.email
    puts 'Password: ' << admin.password
  end
  
  # desc "Test lib source"
  # Rake::TestTask.new(:lib) do |t|
  #   t.libs << "test"
  #   t.pattern = 'test/lib/**/*_test.rb'
  #   t.verbose = true
  # end
end


# namespace :test do
#   desc "Test lib source"
#   Rake::TestTask.new(:lib) do |t|
#     t.libs << "test"
#     t.pattern = 'test/lib/**/*_test.rb'
#     t.verbose = true
#   end
#  
# end
 
# lib_task = Rake::Task["test:lib"]
# test_task = Rake::Task[:test]
# test_task.enhance { lib_task.invoke }


