class Todo < ActiveRecord::Base
  attr_accessible :title, :body, :list_name, :todo_count, :status
  STATUSES = ["incomplete", "complete", "in_progress", "moved", "deleted", "postponed", "important"]

  STATUSES.each_with_index do |status, index| 
    define_method "#{status}?" do
      self.status == index
    end

    define_method "#{status}!" do
      self.update_attributes :status => index
    end 

    define_method "self.all_#{status}" do 
      self.where status.to_sym => index
    end

    define_method "self.create_by_#{status}" do 
      self.create status.to_sym => index
    end
  end
end
