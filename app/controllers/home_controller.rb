class HomeController < ApplicationController
  before_action :authentication_user!, only: :authentication
  def index
  end

  def authentication
  end
end
