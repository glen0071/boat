namespace :scraper do
  desc 'Run the Hennepin Jail scraper'
  task run: :environment do
    HennepinJailScraperService.new.scrape
  end
end
