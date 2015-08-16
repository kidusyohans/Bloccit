class Topic < ActiveRecord::Base
    has_many :posts

    Topic.order('created_at DESC').page(params[:page]).per_page(100)
    
    Will_Paginate.per_page = 100
    
    validates :name, length: { minimum: 5 }, presence: true
    
end

