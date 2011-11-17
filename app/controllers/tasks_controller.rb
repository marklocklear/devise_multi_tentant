class TasksController < ApplicationController
  def index
    @tasks = Task.get_tasks(current_user.organization) #multi-tenancy; only returns tasks with the the current users org
  end

#if conditional below only allows user to view model if it is returned via the get_tasks method
 def show
    if @task = Task. get_tasks(current_user.organization).select {|p| p.id.eql?(params[:id].to_i) }.first
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @patient }
      end
    else
      flash[:notice] = "Unauthorized Page View"
      redirect_to(tasks_url)
    end
  end


  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    @task.organization = current_user.organization #this line sets the org_id for a task

    if @task.save
      redirect_to @task, :notice => "Successfully created task."
    else
      render :action => 'new'
    end
  end

 def edit
    if @task = Task.get_tasks(current_user.organization).select {|p| p.id.eql?(params[:id].to_i) }.first
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @patient }
      end
    else
      flash[:notice] = "Unauthorized Page View"
      redirect_to(tasks_url)
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to @task, :notice  => "Successfully updated task."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_url, :notice => "Successfully destroyed task."
  end
end
