class Article < ApplicationRecord
  # Model associations
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Mount Image uploader
  mount_uploader :image_url, ImageUploader

  # Validations
  validates :title, presence: true, length: { minimum: 2, maximum: 200 }
  validates :content, presence: true, length: { minimum: 2, maximum: 50_000 }
  
  # Callbacks
  after_create :create_slug
  before_save :calculate_read_time
  
  # Scopes
  scope :published, -> { where(published: true).order(published_at: :desc) }
  scope :drafts, -> { where(published: false).order(created_at: :desc) }
  
  private
  
  # Create slugs before saving to the database
  def create_slug
    slug = "#{title.parameterize}-#{id}"
    update(slug: slug)
  end
  
  # Calculate readtime for article before saving to the database
  def calculate_read_time
    self.read_time = (content.split(" ").length / 200).ceil
  end
end
