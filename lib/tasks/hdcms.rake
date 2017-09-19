namespace :db do
  desc 'heroku pg:reset, migrate, seed'
  task hdcms: :environment do
    exec('heroku pg:reset --app chart-scraper-v1 --confirm chart-scraper-v1
      heroku run rake db:migrate --app chart-scraper-v1
      heroku run rake db:seed --app chart-scraper-v1')
  end
end
