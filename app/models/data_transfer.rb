class DataTransfer

  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :direction

  def persisted?
    false
  end

  def self.create(attributes = {})
    # import_data if attributes[:direction] == 'import'
    # export_data if attributes[:direction] == 'export'
  end

  private

  def import_data
    DataTransferService.new(file).import
  end

  def export_data
    DataTransferService.new(file).export
  end
end
