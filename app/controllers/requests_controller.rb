class RequestsController < ApplicationController

  def index
    @request = Request.all
  end
  def new
    @request = Request.new
  end
end
