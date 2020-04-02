class Ticket < ApplicationRecord
  has_one :excavator, dependent: :destroy, autosave: true, validate: true

  validates :request_number, :sequence_number, :request_type,
            :response_due_date_time, :primary_sa_code, :additional_sa_codes,
            :well_known_text, presence: true, allow_blank: false
end
