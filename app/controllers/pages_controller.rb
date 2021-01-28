class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if @stations
      @stations
      p "les stations"
    end
  end
end
