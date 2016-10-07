class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
  	if rider.tickets < current_attraction.tickets && rider.height < current_attraction.min_height
  		"Sorry. You do not have enough tickets the #{current_attraction.name}. You are not tall enough to ride the #{current_attraction.name}."
  	elsif rider.tickets < current_attraction.tickets
	  	"Sorry. You do not have enough tickets the #{current_attraction.name}."
	  elsif rider.height < current_attraction.min_height
	  	"Sorry. You are not tall enough to ride the #{current_attraction.name}."
	  else
	  	rider.tickets -= current_attraction.tickets
	  	rider.nausea += current_attraction.nausea_rating
	  	rider.happiness += current_attraction.happiness_rating
	  	rider.save
	  end
  end

  def rider
  	self.user
  end

  def current_attraction
  	self.attraction
  end
end
