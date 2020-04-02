require 'rails_helper'

RSpec.describe Excavator do
  it 'has a valid factory' do
    expect(build(:excavator)).to be_valid
  end

  it { is_expected.to belong_to :ticket }
  it { is_expected.to validate_presence_of(:company_name) }
  it { is_expected.to validate_presence_of(:address) }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:zip) }
  it { is_expected.to validate_presence_of(:crew_onsite) }
  it { is_expected.to validate_presence_of(:ticket) }
end
