class Topic < ActiveRecord::Base
    has_many :posts, dependent: :destroy
    
    scope :visible_to, -> (user) { user ? all : where(public: true) }

    Topic.order('created_at DESC')
    
    WillPaginate.per_page = 100
    
    validates :name, length: { minimum: 5 }, presence: true
    
end
