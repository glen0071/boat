require 'csv'

class DataTransferService

  def initialize(file)
    self.file = file
  end

  def import

  end

  def export
    klass_strings = ['Author', 'Topic', 'Quote', 'QuoteTopic']

    CSV.generate(headers: true) do |csv|
      csv << attributes

      klass_strings.each do |klass_string|
        klass = Object.const_get klass_string
        klass.all.each do |record|
          csv << klass.columns.map{ |attr| record.send(attr) }
        end
      end
    end
  end
end
