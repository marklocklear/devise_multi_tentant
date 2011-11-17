class Task < ActiveRecord::Base
  belongs_to :organization
  attr_accessible :name, :organization_id

#Calling this from the controller for multi-tenancy
  def self.get_tasks(current_org)
    current_org.tasks
  end

end
