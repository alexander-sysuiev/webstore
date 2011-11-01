class BasketsController < ApplicationController
	def create
		respond_to do |wants|
            wants.js {
            	session[:goods] ||= {}
            	session[:goods][params[:type]] ||= {}
            	quantity = session[:goods][params[:type]][params[:id]].to_i
            	session[:goods][params[:type]][params[:id]] = quantity + 1
            }
		end
	end
end