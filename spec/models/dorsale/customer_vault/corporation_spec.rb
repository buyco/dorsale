require 'rails_helper'

RSpec.describe ::Dorsale::CustomerVault::Corporation, type: :model do
    it { is_expected.to have_one(:address).dependent(:destroy) }
    it { is_expected.to have_many :comments }

    it { is_expected.to have_many(:comments).dependent(:destroy) }

    it { is_expected.to validate_presence_of :corporation_name }
end

