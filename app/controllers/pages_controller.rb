class PagesController < ApplicationController
  def all_directors
    render(:template => "all_directors")
  end

  def one_director
    render(:template => "one_director")
  end

  def all_actors
    render(:template => "all_actors")
  end

  def one_actor
    render(:template => "one_actor")
  end

  def all_movies
    render(:template => "all_movies")
  end

  def one_movie
    render(:template => "one_movie")
  end


end
