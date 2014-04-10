class Player < ActiveRecord::Base
  belongs_to :team
  has_many :cards

  def name
    "#{last_name}, #{first_name} "
  end

  def as_json(options = {}) 
    super(:only => [:id], :methods => :name)
  end 
  
end
