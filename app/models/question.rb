class Question < ActiveRecord::Base
  has_many :options
  has_many :correct_options

  scope :next, lambda {|id| where("id > ?",id).order("id ASC") }
  scope :previous, lambda {|id| where("id < ?",id).order("id DESC") }

  def next
    Question.next(self.id).first
  end

  def previous
    Question.previous(self.id).first
  end

end
