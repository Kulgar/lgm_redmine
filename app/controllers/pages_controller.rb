class PagesController < ApplicationController

  def home
    @title = "Home page"
  end

  def admin
    raise NotAuthorized
  end

end
