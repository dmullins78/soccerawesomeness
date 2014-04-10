class Field < ActiveRecord::Base

  def as_json(options = nil) #:nodoc:
    super(:only => [:name])
  end

end
