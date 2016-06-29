class UserStory < ActiveRecord::Base
  
  belongs_to :project
  belongs_to :user
  
  include RankedModel
    ranks :row_order
   
end
