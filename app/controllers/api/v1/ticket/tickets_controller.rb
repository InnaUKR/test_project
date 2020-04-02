module Api
  module V1
    module Ticket
      class TicketsController < ::ApplicationController
        skip_before_action :verify_authenticity_token, only: :create
        before_action :json, only: :create

        def create
          ticket = ::Ticket.new(ticket_params)
          ticket.build_excavator(excavator_params)
          ticket.save!
          render json: ticket, status: :created, serializer: serializer
        end

        private

        def json
          @json = JSON.parse(request.raw_post).deep_transform_keys! { |key| key.underscore.to_sym }
        end

        def excavator_params
          @json.dig(:excavator)
               &.slice(:company_name, :address, :city, :state, :zip, :crew_onsite)
        end

        def ticket_params
          params = @json.slice(:request_number, :sequence_number, :request_type)
          params[:response_due_date_time] = @json.dig(:date_times, :response_due_date_time)
          params[:primary_sa_code] = @json.dig(:service_area, :primary_service_area_code, :sa_code)
          params[:additional_sa_codes] = @json.dig(:service_area, :additional_service_area_codes, :sa_code)
          params[:well_known_text] = @json.dig(:excavation_info, :digsite_info, :well_known_text)
          params
        end

        def serializer
          Api::V1::TicketSerializer
        end
      end
    end
  end
end
