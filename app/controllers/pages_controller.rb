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
    
    @direc_id_to_display=params.fetch("director_id")
      if @direc_id_to_display=="eldest"

        start_eldest=Director.order(:dob) 
        oldest_director_open=start_eldest.at(0)
        @oldest_director_name=Director.order(:dob).at(0).name
        render(:template => "eldest_director")

      elsif @direc_id_to_display=="youngest"
        start_youngest=Director.order(:dob).reverse
        youngest_director_open=start_youngest.at(0)
        @youngest_director_name=youngest_director_open.name
        render(:template => "youngest_director")

      else
  
    direc_selected= Director.all.where(:id => @direc_id_to_display)
  
    @display_relation=direc_selected
    open_relation= direc_selected.at(0)
    @display_id= open_relation.id
    @direc_name=open_relation.name
    
   @finding_movies=Movie.all.where(:director_id => @display_id)
  

    render(:template => "one_director")

      end
  end


  #def eldest_director

  #  start_eldest=Director.order(:dob) 
  #  oldest_director_open=start_eldest.at(0)
  #  @oldest_director_name=oldest_director_open.name

  #  render(:template => "one_director")
  #end


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
    get_movie_info= Movie.all
    number=-1
    @movie_array=Array.new
    get_movie_info.each do |display|
      number= number + 1
      mov= Movie.all.at(number)
      @movie_array.push(mov)
    end 

    render(:template => "all_movies")
  end

  def one_movie

       
    @movie_id_to_display=params.fetch("movie_id").to_i
  
    movie_selected= Movie.all.where(:id => @movie_id_to_display)
  
    @display_relation_movie=movie_selected
    open_relation_movie= movie_selected.at(0)
    @display_id_movie= open_relation_movie.id
    @direc_name_movie=open_relation_movie.title
    
  
    render(:template => "one_movie")
  end


end
