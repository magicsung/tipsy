class Admin::StoreController < ApplicationController
  layout "admin"

  before_action :authenticate_admin

  def index
    
  end


end
