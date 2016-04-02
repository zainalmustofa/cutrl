# == Schema Information
#
# Table name: dashboards
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_dashboards_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_8cb1930a1d  (user_id => users.id)
#

class Dashboard < ActiveRecord::Base
  belongs_to :user
end
