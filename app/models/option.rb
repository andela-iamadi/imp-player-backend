class Option < ActiveRecord::Base
  belongs_to :question
  has_one :correct_option
end
