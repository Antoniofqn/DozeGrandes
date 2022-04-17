class MatchesController < ApplicationController
  def index
    if params['search'].present?
      @home = Club.find_by(name: params['search'][:home])
      @away = Club.find_by(name: params['search'][:away])
      @matches = Match.filter(params['search'].slice(:competition, :stadium)).where(home: [@home, @away], away: [@home, @away]) if params['search'].present?
    else
      @matches = Match.all
    end
  end
end
