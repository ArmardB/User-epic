class UserStory < ActiveRecord::Base
    belongs_to :project
    
    include RankedModel
        ranks :row_order
   
end
