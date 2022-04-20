class MatchesController < ApplicationController
  def index
    if params['search'].present?
      @home = Club.find_by(name: params['search'][:home])
      @away = Club.find_by(name: params['search'][:away])
      @matches = Match.filter(params['search'].slice(:competition, :stadium, "start_date(1i)", "end_date(1i)")).where(home: [@home, @away], away: [@home, @away])
      @stadiums = stadium_selection(@matches)
      @competitions = competition_selection(@matches)
    else
      @matches = Match.all
    end
  end

  private

  def stadium_selection(matches)
    stadiums = []
    matches.each do |match|
      stadiums << match.stadium unless match.stadium.in?(stadiums)
    end
    stadiums
  end

  def competition_selection(matches)
    competitions = []
    matches.each do |match|
      competitions << match.competition unless match.competition.in?(competitions)
    end
    competitions
  end

end
