require 'csv'
require 'fileutils'

class DataTransferService

  attr_accessor :dir, :direction

  def initialize(direction, dir = nil)
    self.direction = direction
    self.dir = dir
  end

  def import
    klass_strings = ['Author', 'Topic', 'Quote', 'QuoteTopic']
    full_path = Rails.root.join('data', 'exports', self.dir)
    klass_strings.each do |klass_string|

      csv = CSV.read("#{full_path}/#{klass_string}.csv", :headers => true)
      csv.each do |row|
        klass = Object.const_get klass_string
        klass.find_or_create_by(row.to_hash)
      end
    end
  end

  def export
    klass_strings = ['Author', 'Topic', 'Quote', 'QuoteTopic']
    dir_path = Rails.root.join(
      'data', 'exports', DateTime.now.strftime('%v_%H_%M_%S')
    )
    FileUtils.mkdir_p dir_path

    klass_strings.each do |klass_string|
      file_path = "#{dir_path}/#{klass_string}.csv"
      CSV.open(file_path, "wb") do |csv|
        klass = Object.const_get klass_string
        csv << klass.column_names
        klass.all.each do |record|
          csv << klass.column_names.map{ |attr| record.send(attr) }
        end
      end
    end
  end
end
