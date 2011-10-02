module RatingMacro
  extend ActiveSupport::Concern

  module InstanceMethods
    def avg_useful_rating
      feedbacks.average(:useful_rating).to_i
    end

    def avg_content_rating
      feedbacks.average(:content_rating).to_i
    end

    def avg_interact_rating
      feedbacks.average(:interact_rating).to_i
    end
  end

end