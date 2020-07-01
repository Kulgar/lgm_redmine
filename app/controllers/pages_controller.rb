class PagesController < ApplicationController

  def home
  end

  def admin
    raise NotAuthorized
  end

end
