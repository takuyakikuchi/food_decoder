class HistoriesController < ApplicationController
  def index
    @allergens = current_user.restrictions.map do |restriction|
      restriction.name
    end
    @histories = policy_scope(History)
  end
end
