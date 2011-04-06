class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery

  layout :set_right_layout

private

  def set_right_layout
    current_user ? 'application.html.erb' : 'guest.html.erb'
  end
end
