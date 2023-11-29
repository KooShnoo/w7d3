# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  band_id    :bigint
#  title      :string
#  year       :integer
#  live       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
  validates :title, uniqueness: true
  belongs_to :band
end
