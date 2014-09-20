class PagesController < ApplicationController

  def index
    @destinations = Trip.pluck("destination")
  end

  def about
  end

  def contact
  end
end
