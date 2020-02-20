# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Source, type: :model do
  it { is_expected.to belong_to(:author) }
  it { is_expected.to have_many(:topics) }
  it { is_expected.to have_many(:quotes) }

end
