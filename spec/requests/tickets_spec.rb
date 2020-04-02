require 'rails_helper'

RSpec.describe 'Ticket API', type: :request do
  describe 'POST /tickets' do
    let(:valid_attributes) do
      JSON.parse(file_fixture('ticket_request_params.json').read)
    end

    context 'when the request is valid' do
      let(:request) { post '/api/v1/tickets', params: valid_attributes, as: :json }

      it 'creates a new ticket' do
        expect { request }.to change(Ticket, :count).by(+1)
      end

      context 'created ticket has a proper parameter' do
        before { request }

        it 'request_number' do
          expect(json['request_number']).to eq(valid_attributes['RequestNumber'])
        end
 
        it 'sequence_number' do
          expect(json['sequence_number']).to eq(valid_attributes['SequenceNumber'])
        end

        it 'request_type' do 
          expect(json['request_type']).to eq(valid_attributes['RequestType'])
        end

        it 'response_due_date_time' do
          expect(json['response_due_date_time'].to_datetime)
            .to eq(valid_attributes['DateTimes']['ResponseDueDateTime'].to_datetime)
        end

        it 'primary_sa_code' do
          expect(json['primary_sa_code']).to eq(valid_attributes['ServiceArea']['PrimaryServiceAreaCode']['SACode'])
        end

        it 'additional_sa_codes' do
          expect(json['additional_sa_codes'])
            .to eq(valid_attributes['ServiceArea']['AdditionalServiceAreaCodes']['SACode'])
        end

        it 'well_known_text' do
          expect(json['well_known_text']).to eq(valid_attributes['ExcavationInfo']['DigsiteInfo']['WellKnownText'])
        end

        it 'returns status code 201' do
          expect(response).to have_http_status(201)
        end
      end

      it 'creates a new excavator' do
        expect { request }.to change(Excavator, :count).by(+1)
      end

      context 'created excavator has a proper parameter' do
        before { request }
        it 'company_name' do
          expect(json['excavator']['company_name']).to eq(valid_attributes['Excavator']['CompanyName'])
        end

        it 'address' do
          expect(json['excavator']['address']).to eq(valid_attributes['Excavator']['Address'])
        end

        it 'city' do
          expect(json['excavator']['city']).to eq(valid_attributes['Excavator']['City'])
        end

        it 'state' do
          expect(json['excavator']['state']).to eq(valid_attributes['Excavator']['State'])
        end

        it 'zip' do
          expect(json['excavator']['zip']).to eq(valid_attributes['Excavator']['Zip'])
        end

        it 'state' do
          expect(json['excavator']['crew_onsite']).to be_in([true, false])
        end
      end
    end

    context 'when the request is invalid' do
      before do
        post '/api/v1/tickets', params: {}, as: :json
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Request number can't be blank/)
      end
    end
  end
end
