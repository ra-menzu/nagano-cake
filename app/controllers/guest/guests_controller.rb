class Guest::GuestsController < ApplicationController
	def top
		@guests = Guest.all
	end
end
