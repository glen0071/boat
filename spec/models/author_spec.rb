require 'rails_helper'

RSpec.describe Author, type: :model do
  it { is_expected.to have_many(:quotes) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
end
