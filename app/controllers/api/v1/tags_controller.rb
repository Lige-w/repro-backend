class Api::V1::TagsController < ApplicationController

  def index
    render json: current_user.tags.uniq
  end
end

