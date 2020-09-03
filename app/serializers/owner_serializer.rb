class OwnerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :email
  has_one :foodtruck


  def initialize(owner)
    @owner = owner
  end
 
  def to_serialized_json
    @owner.to_json(:include => {
      :foodtruck })
      #  :except => [:updated_at]
  end




end


