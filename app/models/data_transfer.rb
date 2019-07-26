class DataTransfer

  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :direction

  def persisted?
    false
  end

  def self.create(attributes = {})
    import_data if attributes[:direction] == 'import'
    export_data if attributes[:direction] == 'export'
  end

  private

  def self.import_data
    DataTransferService.new(:import, file).import
  end

  def self.export_data
    DataTransferService.new(:export).export
  end
end
