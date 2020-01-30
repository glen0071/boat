# frozen_string_literal: true

class Query
  attr_accessor :q

  include ActiveModel::Conversion
  extend ActiveModel::Naming

  def persisted?
    false
  end
end
