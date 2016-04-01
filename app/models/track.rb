# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  track_t    :string           not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null

class Track < ActiveRecord::Base
  TYPES = ['Bonus', 'Regular']

  belongs_to :album, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_one :band,
    through: :album,
    source: :band

  validates :name, :track_t, :album, presence: true
  validates :track_t, inclusion: { in: TYPES }

end
