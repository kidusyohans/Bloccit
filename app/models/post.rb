class Post < ActiveRecord::Base
    has_many :comments
    belongs_to :user
    
    default_scope { order('created_at DESC') }
    scope :ordered_by_title, -> { update(ordered_by_title: true) }
    scope :ordered_by_reverse_created_at, -> { 
    	update(ordered_by_reverse_created_at: true)
  }


end
