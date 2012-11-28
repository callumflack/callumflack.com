desc <<-DESC
Deploy application to heroku.
  account=[name] if multiple heroku accounts
DESC
task :deploy do
  system "git init 1>/dev/null"
  remotes = `git remote`.chomp.split("\n")
  if remotes.include? 'heroku'
    `git push heroku master`
  else
    app_name = File.basename(File.expand_path("..", __FILE__))
    app_name.gsub!('_', '-')
    options = "-s cedar"
    options << " --account=#{ENV['account']}" if ENV['account']
    `heroku apps:create #{app_name} #{options}`
  end
end
