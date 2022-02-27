class CommonRequest
  include ActiveModel::Model
  # include ActiveModel::Serializers::JSON
  
  # attr_accessor :sort_column, :sort_direction, :page, :per_page, :keyword

  # # ADDRESS_BEFORE_PRODUCTION
  # def validate_errors?(scenario = []) # Its name should be has_errors?
  #   self.invalid?(scenario)
  # end
  # # ADDRESS_BEFORE_PRODUCTION
  # def validate_exceptions?(scenario = []) # Its name should be has_exceptions?
  #   raise "Error Found in #{self.class}: #{self.errors.details}" if self.invalid?(scenario)
  #   return true
  # end

  # def promote_errors(child_errors)
  #   child_errors.each do |attribute, message|
  #     errors.add(attribute, message)
  #   end
  # end

  # def errors_in_fetched_info?(vehicle_request)
  #   # ADDRESS_BEFORE_PRODUCTION
  #   vehicle_request.validate_errors?(:current_location)# ||
  #   # vehicle_request.validate_errors?(:fuel_level) ||
  #   # vehicle_request.validate_errors?(:odometer_reading)
  # end

end
