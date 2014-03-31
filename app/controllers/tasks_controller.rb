class TasksController < ApplicationController
  def index
    @done_tasks = Task.done_tasks
    @not_done_tasks = Task.not_done_tasks
    render('tasks/index.html.erb')
  end

  def create
    @task = Task.new(:task => params[:task],
                        :done => false)
    if @task.save
      render('tasks/success.html.erb')
    else
      render('tasks/new.html.erb')
    end
  end

  def new
    @task = Task.new
    render('tasks/new.html.erb')
  end

  def marked_done
    @task = Task.find(params[:id])
    @task.update(:done => true)
    render('tasks/show.html.erb')
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(:task => params[:task])
       render('tasks/success.html.erb')
    else
      render('tasks/edit.html.erb')
    end
  end

  def show
    @task = Task.find(params[:id])
    render('tasks/show.html.erb')
  end

  def edit
    @task = Task.find(params[:id])
    render('tasks/edit.html.erb')
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    render('tasks/destroy.html.erb')
  end
end
