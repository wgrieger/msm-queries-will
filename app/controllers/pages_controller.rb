class PagesController < ApplicationController
  def all_directors

    #app 
    get_direc_info= Director.all
    number=-1
    @direc_array=Array.new
    get_direc_info.each do |display|
      number= number + 1
      direc= Director.all.at(number)
      @direc_array.push(direc)
    end 
    
    
    render(:template => "all_directors")
  end

  def one_director
    
    @direc_id_to_display=params.fetch("director_id").to_i
  
    direc_selected= Director.all.where(:id => @direc_id_to_display)
  
    @display_relation=direc_selected
    open_relation= direc_selected.at(0)
    @display_id= open_relation.id
    @direc_name=open_relation.name
    
   @finding_movies=Movie.all.where(:director_id => @display_id)
  

    render(:template => "one_director")
  end


  def eldest_director
    render(:template => "one_director")
  end


  def youngest_director
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
