require 'rails_helper'

RSpec.describe Ticket do
  it 'has a valid factory' do
    expect(build(:ticket)).to be_valid
  end

  it { is_expected.to have_one(:excavator).dependent(:destroy).autosave(true) }
  it { is_expected.to validate_presence_of(:request_number) }
  it { is_expected.to validate_presence_of(:sequence_number) }
  it { is_expected.to validate_presence_of(:request_type) }
  it { is_expected.to validate_presence_of(:response_due_date_time) }
  it { is_expected.to validate_presence_of(:primary_sa_code) }
  it { is_expected.to validate_presence_of(:additional_sa_codes) }
  it { is_expected.to validate_presence_of(:well_known_text) }
end
