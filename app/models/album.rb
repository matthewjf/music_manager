# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  alb_t      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#

class Album < ActiveRecord::Base
  TYPES = ["Live", "Studio"]
  belongs_to :band, dependent: :destroy
  has_many :tracks

  validates :band_id, :alb_t, :name, presence: true
  validates :alb_t, inclusion: { in: TYPES }
end
