class CartsController < ApplicationController
	def create
		respond_to do |wants|
                  wants.js do
                  	session[:goods] ||= {}
                  	session[:goods][params[:type]] ||= {}
                  	quantity = session[:goods][params[:type]][params[:id]].to_i
                  	session[:goods][params[:type]][params[:id]] = quantity + 1
                        generate_session
                  end
		end
	end

      def decrease
            respond_to do |wants|
                  wants.js do
                        session[:goods] ||= {}
                        session[:goods][params[:type]] ||= {}
                        quantity = session[:goods][params[:type]][params[:id]].to_i - 1
                        session[:goods][params[:type]][params[:id]] = quantity
                        session[:goods][params[:type]].delete(params[:id]) if quantity == 0
                        generate_session
                  end
            end
            render 'create'
      end

      def clear
            respond_to do |wants|
                  wants.js { session[:goods] = nil }
            end
            generate_session
            render 'create'
      end
end