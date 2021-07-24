# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  description :text             not null
#  name        :string           not null
#  sex         :string(1)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'action_view'

class Cat < ApplicationRecord

    include ActionView::Helpers::DateHelper

    COLORS = %w(orange black white grey black/white grey/white orange/white black/grey)

    validates :birth_date,:color,:description,:name,:sex,presence:true
    validates :sex,inclusion: ['f','m']
    validates :color,inclusion: [*COLORS]

    def age
        #Time.now.year - birth_date.year
        #-c.birth_date.years_ago(Time.now.year).year
        time_ago_in_words((Time.now.year - birth_date.year).years.ago)
    end
end
