class SitesController < ApplicationController
  
  def index
    @site = Site.find_by_name(current_account.name)
  end
  
  def opps
    @site = Site.find_by_name(current_account.name)
  end

end
