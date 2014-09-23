class LotsController < ApplicationController
  def index
    @lots = Lots.all
  end
end
