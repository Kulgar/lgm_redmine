class AdminController < ApplicationController
  before_action :user_signed_in?
  before_action :is_admin?

  private

    def is_admin?
      raise NotAuthorized unless current_user&.admin?
    end
end
