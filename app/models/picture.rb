class Picture
  include Mongoid::Document
  include Mongoid::Paperclip

  embedded_in :product, :inverse_of => :pictures

  has_mongoid_attached_file :attachment
  crop_attached_file :attachment
    # :convert_options => { :all => '-background white -flatten +matte' }
  do_not_validate_attachment_file_type :attachment
end
