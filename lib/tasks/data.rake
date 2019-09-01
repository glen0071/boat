namespace :data do
  desc "export data to dir of csvs"
  task :import, [:file] => [:environment] do |task, args|
    DataTransferJsonService.import(args.file)
  end

  desc "export data to dir of csvs"
  task :export => [:environment] do |task, args|
    DataTransferJsonService.export
  end
end
