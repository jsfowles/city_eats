class Restaurant < ActiveRecord::Base

  RATINGS = [1,2,3,4,5]
  belongs_to :city

  validates_presence_of :name, :food_type
  validates :cost_rating, inclusion: {in: RATINGS}
  validates :open, :alcohol, :take_out, inclusion: {in: [true,false]}

# class method on active record model is called scope
# restautant.all.by_name
  def self.by_name
    order(:name)
  end

  def self.ratings
    RATINGS
  end
#
  def self.by_cost
    order(:cost_rating)
  end

#instance method
#restaurant.first.status
  def status
    if self.open
      "The Restaurant: #{self.name} is open for business!"
    else
      "The Restaurant: #{self.name} opens very soon"
    end
  end
end
