class ApplicationController < ActionController::Base

  before_action :set_locale

  class NotAuthorized < StandardError
  end

  rescue_from NotAuthorized, with: :deny_access

  private

    def deny_access
      flash[:alert] = "Vous n'êtes pas administrateur"
      redirect_to root_path
    end

    def set_locale
      # https://api.rubyonrails.org/
      if params[:locale]
        session[:locale] = params[:locale]
        cookies.permanent[:persistent] = params[:locale]
      end
      I18n.locale = session[:locale]
    end

end
