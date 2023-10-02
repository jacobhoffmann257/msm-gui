class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
  def add
    @actor = Actor.new
    @actor.name = params.fetch("query_name")
    @actor.dob = params.fetch("query_dob")
    @actor.bio = params.fetch("query_bio")
    @actor.image = params.fetch("query_image")
    if @actor.valid?
      @actor.save
      redirect_to("/actors",{:notice => "Actor added successfully."})
    else
      redirect_to("/actors",{:notice => "Actor failed to add successfully"})
    end
  end
  def delete
    the_id = params.fetch("path_id")
    @actor = Actor.where({:id => the_id}).at(0)
    @actor.destroy
    redirect_to("/actors",{:notice => "Actor has been delt with"})
  end
  def update
    id = params.fetch("path_id")
    @actor = Actor.where({:id => id}).at(0)
    
    @actor.name = params.fetch("query_name")
    @actor.dob = params.fetch("query_dob")
    @actor.bio = params.fetch("query_bio")
    @actor.image = params.fetch("query_image")

    if @actor.valid?
    @actor.save
    redirect_to("/actors/#{@actor.id}", {:notice => "Actor successfully updated."})
    else
      redirect_to("/actors/#{@actor.id}", {:notice => "Actor failed to update succesfully."})
    end
  end
end
