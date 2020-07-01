class ApplicationController < ActionController::Base

  class NotAuthorized < StandardError
  end

  rescue_from NotAuthorized, with: :deny_access

  private

    def deny_access
      flash[:alert] = "Vous n'êtes pas administrateur"
      redirect_to root_path
    end

end
