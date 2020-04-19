class NotesController < ApplicationController
  before_action :set_note, only: [:edit, :show, :update, :destroy]
  
  #Define the @destination in the 'new' and 'create' methods because you have to
  #pass the :destination_id / @destination.id in the view/notes/new.html.erb file.
    def new
      @destination = Destination.find(params[:destination_id])
      @note = Note.new
    end
  
    def create
      #@destination = Destination.find(params[:notes][:destination_id])
      @note = Note.new(note_params)
      #@note.destination = @destination
      if @note.save
      #Below takes the destination for this note and gets the url for
       #all the notes for this destination  
      redirect_to destination_notes_path(@note.destination)
      else
      render :new    
      end
    end


    def edit
    end
        
    def index
      
      @destination = Destination.find(params[:destination_id])
      
      if params[:last_three].present?
        @notes = Note.most_recent(@destination)
      else
        @notes = @destination.notes
      end
 
    end
   
    def show
    end

    def update
      @note.update(note_params)
        redirect_to note_path(@note)unless @note.errors.any?
    end
   
    def destroy
      if @note.present?
        @note.destroy
      end
      redirect_to destination_path(@note.destination)
    end
          
    private
      
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:date, :content, :destination_id)
    end
  end