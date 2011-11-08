class ApplicationController < ActionController::Base
  require 'cart_session'
  protect_from_forgery
  before_filter :generate_session
 
private
  
  def generate_session
  	@cart_session = CartSession.new session
  end
end
