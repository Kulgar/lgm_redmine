class PagesController < ApplicationController

  def home
    @test = "hello"
  end

  def admin
    raise NotAuthorized
  end

end
