# frozen_string_literal: true

namespace :data do
  desc 'export data to dir of csvs'
  task :import, [:file] => [:environment] do |_task, args|
    DataTransferJsonService.import(args.file)
  end

  desc 'export data to dir of csvs'
  task export: [:environment] do |_task, _args|
    DataTransferJsonService.export
  end
end
