class Album < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_and_belongs_to_many :artists
  validates :name, presence: true
  validates_length_of :name, maximum: 100
  has_one_attached :album_cover_photo

  before_save(:titleize_album)

  scope :rock, -> { where(genre: "rock") }
  scope :search, -> (name_parameter) { where("name like ?", "%#{name_parameter}%")}
  private
    def titleize_album
      self.name = self.name.titleize
    end
end