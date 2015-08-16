class SubjectsController < ApplicationController

	layout false

  def index
  	@subjects = Subject.sorted
  end

  def show
  	@Subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})
  end

  def create
   # Instantiate a new object form parameters
   @subject = Subject.new(subject_params)
   # Save the object
   if @subject.save
      # If save succeeds, redirect to the index action
     redirect_to(:action => 'index')
   else
   # If save fails, redisplay the form so user can fix problems
   render('new')
   end
  end


  def edit
    @Subject = Subject.find(params[:id])
  end

  def update
   # Find aa existing object form parameters
   @Subject = Subject.find(params[:id])
  
   # Update the object
   if @subject.update_attributes(subject_params)
      # If update succeeds, redirect to the index action
     redirect_to(:action => 'show', :id => @subject.id)
   else
   # If update fails, redisplay the form so user can fix problems
   render('edit')
   end
  end

  def delete
  end

  private

    def subject_params
      params.require(:subject).permit(:name, :position, :visible)
    end
end