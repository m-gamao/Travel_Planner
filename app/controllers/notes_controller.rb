class NotesController < ApplicationController
    def new
      @note = Note.new
    end
  
    def edit
      @note = Note.find_by(id: params[:id])
    end
  
    def index
      @notes = Note.all
    end
    
    def show
      @note = Note.find_by(id: params[:id])
    end

    def update
      @note = Note.find_by(id: params[:id])
      @note.update(note_params)
        redirect_to user_path(current_user)unless @note.errors.any?
    end
  
    def update
      @note = Notes.find_by(id: params[:id])
      @note.update(note_params)
      redirect_to user_path(current_user)unless @note.errors.any?
    end
    
          
    private
      
    def note_params
      params.require(:note).permit(:content)
    end