class Topic < ActiveRecord::Base
    has_many :posts

    Topic.order('created_at DESC').page(params[:page]).per_page(10)
    
    validates :name, length: { minimum: 5 }, presence: true
    
end
