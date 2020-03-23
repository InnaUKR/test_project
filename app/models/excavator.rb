class Excavator < ApplicationRecord
  belongs_to :ticket

  validates :company_name, :address, :city, :zip, :crew_onsite, :ticket, presence: true
end
