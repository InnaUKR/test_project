class ErrorSerializer < ActiveModel::Serializer
  attributes :errors

  def errors
    return if object.errors.nil?

    errors_hash
  end

  private

  def errors_hash
    object.errors.to_hash(true).map do |key, value|
      value.map do |msg|
        { id: key, title: msg }
      end
    end.flatten
  end
end
