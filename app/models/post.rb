class Post < ActiveRecord::Base
    has_many :comments
    has_many :summaries
    belongs_to :user
    belongs_to :topic

    
    default_scope { order('created_at DESC') }
    scope :ordered_by_title, -> { update(ordered_by_title: true) }
    scope :ordered_by_reverse_created_at, -> { 
    	update(ordered_by_reverse_created_at: true)
  }
  
  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true


end
