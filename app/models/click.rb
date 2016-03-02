# == Schema Information
#
# Table name: clicks
#
#  id         :integer          not null, primary key
#  url_id     :integer
#  referer    :text
#  count      :integer          default(0)
#  browser    :string
#  is_mobile  :boolean
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_clicks_on_url_id  (url_id)
#
# Foreign Keys
#
#  fk_rails_2f2ced7848  (url_id => urls.id)
#

class Click < ActiveRecord::Base
  belongs_to :url
end
