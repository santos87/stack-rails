class Story < ActiveRecord::Base

	# this is a connection in rails
	# our story has many comments AND has many votes
	has_many :comments
	has_many :votes



	# set up acts as taggable
	acts_as_taggable



	validates :title, length: { minimum: 5 }
	validates :description, presence: true
	validates :url, presence: true, uniqueness: { message: "Has already been submitted"}

	before_save do
		unless url.include? "http://"		
			self.url = "http://#{self.url}"
		end
	end

	# i want to overwrite the url structure in activerecord
	# activerecord is the rails way to manage models
	# to_param is the method we want to overwrite
	# i want my title to be something like 7-designer-new
	# this is my ID then my title as a url

	def to_param
		"#{id}-#{title.parameterize}"
		
	end


	# this is my own shortcut to make nice clean urls for our users
	def nice_url
		# i want to take the url
		# and i want to remove http://
		# and i want to remove www.
		# gsub is global substitution
		url.gsub("http://", "").gsub("www.", "")
	end

end
