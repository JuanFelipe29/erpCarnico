class Cut < ApplicationRecord
  belongs_to :piece
  belongs_to :cut_name
  belongs_to :cut_type
end
