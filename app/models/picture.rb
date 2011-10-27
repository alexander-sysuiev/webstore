class Picture < ActiveRecord::Base
	has_one :boiler
	has_attached_file	:photo,
					    :storage => :s3,
					    :bucket => 'mybucket',
					    :s3_credentials => {
					      :access_key_id => ENV['S3_KEY'],
					      :secret_access_key => ENV['S3_SECRET']
					    } 
					 	:styles => { :thumb=> "100x100#", :preview  => "400x400>" },
					 	:url => "/assets/pictures/:id/:style/:basename.:extension",
					 	:path => ":rails_root/public/assets/pictures/:id/:style/:basename.:extension"
	before_destroy :delete_attachments
private
	
	def delete_attachments
		photo.destroy
	end
end