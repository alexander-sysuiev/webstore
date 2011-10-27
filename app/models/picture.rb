class Picture < ActiveRecord::Base
	has_one :boiler
	has_attached_file :photo, :styles => { :thumb=> "100x100#", :preview  => "400x400>" },
														:url => "/assets/pictures/:id/:style/:basename.:extension",
														:path => ":rails_root/public/assets/pictures/:id/:style/:basename.:extension"
	before_destroy :delete_attachments
private
	
	def delete_attachments
		photo.destroy
	end
end