module Api
  module V1
    class TicketSerializer < ActiveModel::Serializer
      attributes :id, :request_number, :sequence_number, :request_type, :response_due_date_time,
                 :primary_sa_code, :additional_sa_codes, :well_known_text
      has_one :excavator, serializer: ExcavatorSerializer
    end
  end
end