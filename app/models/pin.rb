class Pin < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, :styles => {
      :medium => '300x300',
      :thumb => '100x100'
    }
  validates_attachment :image, presence: true,
    content_type: { :content_type => ['image/jpg', 'image/jpeg', 'image/png'] },
    size: { :less_than => 2.megabytes }

  validates :description, presence: true

  def self.search(search)
    if search
      where('description LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
