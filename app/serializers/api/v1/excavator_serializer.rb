module Api
  module V1
    class ExcavatorSerializer < ActiveModel::Serializer
      attributes :id, :company_name, :address, :city, :state, :zip, :crew_onsite
    end
  end
end