class UserStory < ActiveRecord::Base
    belongs_to :project
    
    acts_as_sortable
end
