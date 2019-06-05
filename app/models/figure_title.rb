class FigureTitle < ActiveRecord::Base
  belongs_to :figure
  belongs_to :titles
end
