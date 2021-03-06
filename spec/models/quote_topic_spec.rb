# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuoteTopic, type: :model do
  it { is_expected.to belong_to(:quote) }
  it { is_expected.to belong_to(:topic) }
end
