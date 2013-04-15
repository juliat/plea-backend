class Note < ActiveRecord::Base
  attr_accessible :text

  # Relationships
  # ========================================================================
  belongs_to :notable, :polymorphic => true
  
end
