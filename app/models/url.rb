# == Schema Information
#
# Table name: urls
#
#  id          :integer          not null, primary key
#  url         :text             not null
#  title       :text
#  referer     :string
#  slug        :string           not null
#  count_click :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
# Indexes
#
#  index_urls_on_user_id  (user_id)
#

class Url < ActiveRecord::Base
  has_many :clicks
  belongs_to :user
  validates :url, presence: true
  validates :url, format: { with: URI.regexp }, if: Proc.new { |a| a.url.present? }

  def build_slug
    Array.new(4){[*"A".."Z", *"0".."9"].sample}.join
  end
end
