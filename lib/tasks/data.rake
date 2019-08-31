namespace :data do
  desc "import data from dir of csvs"
  task :import, [:dir] => [:environment] do |task, args|
    DataTransferService.new('import', args.dir).import
  end

end
