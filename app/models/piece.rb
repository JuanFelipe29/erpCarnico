class Piece < ApplicationRecord
  belongs_to :channel
  belongs_to :piece_name
end
