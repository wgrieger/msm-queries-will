#needed to learn to use .pluck...

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




  def youngest_director
    render(:template => "one_director")
  end

  def all_actors
    get_actor_info= Actor.all
    number=-1
    @actor_array=Array.new
    get_actor_info.each do |display|
      number= number + 1
      actor= Actor.all.at(number)
      @actor_array.push(actor)
    end
    render(:template => "all_actors")
  end

  def one_actor
    @actor_id_to_display=params.fetch("actor_id")
    actor_selected= Actor.all.where(:id => @actor_id_to_display)
  
    @actor_relation=actor_selected
    @open_relation_actor= actor_selected.at(0)
    @display_id_actor= @open_relation_actor.id
    @actor_name=@open_relation_actor.name
    
   @finding_characters_actor_1=Character.all.where(:actor_id => @actor_id_to_display)
   @char_array=Array.new
   char_number=-1
   @finding_characters_actor_1.each do |find_char|
    char_number=char_number+1
    @char_array.push(@finding_characters_actor_1.at(char_number).name)

   end 


   @movie_array=Array.new
   @finding_characters_actor_1.each do |find_movie|
      @movie_array.push(find_movie.movie_id)
     end 
  
     @movie_list=Array.new
     number_array=-1
     @movie_array.each do |pull_movie|
        number_array=number_array+1
       @movie_list.push(Movie.all.where(:id => @movie_array[number_array]))
     end

     movie_list_number=-1
     @movie_list.each do
      movie_list_number=movie_list_number+1
      @movie_list.at(movie_list_number)
     end
    

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
