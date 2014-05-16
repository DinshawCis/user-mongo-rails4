class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  include Mongoid::Paperclip
  include Sunspot::Mongoid2
  searchable do
    text :name
  end
  field :name, type: String
  slug :name
  field :description, type: String
  field :price, type: Float

  belongs_to :user
  accepts_nested_attributes_for :user
  embeds_many :pictures, :cascade_callbacks => true
  accepts_nested_attributes_for :pictures

  has_mongoid_attached_file :avatar, styles: { :cropped => '' }
  crop_attached_file :avatar, :aspect => "16:9"
  do_not_validate_attachment_file_type :avatar

  # rateable range: (-5..7), raters
  validates_presence_of :name, :description, :price
  validates :name, uniqueness: true
  embeds_many :comments
end
