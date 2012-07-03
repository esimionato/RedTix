Capybara.default_driver = :webkit
pow_config = "#{Rails.root}/.powenv"
pow_config_stash = "#{Rails.root}/.powenv_original"

Before do
  Capybara.app_host = 'http://www.redtix.dev'

  File.rename(pow_config, pow_config_stash) if File.exists?(pow_config)

  f = File.new("#{Rails.root}/.powenv", 'w')
  f.write('export RAILS_ENV=test')
  f.close

  FileUtils.touch("#{Rails.root}/tmp/restart.txt")
end

After do
  File.delete(pow_config)

  File.rename(pow_config_stash, pow_config) if File.exists?(pow_config_stash)

  FileUtils.touch("#{Rails.root}/tmp/restart.txt")
end
