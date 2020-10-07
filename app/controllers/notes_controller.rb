class NotesController < ApplicationController

    def index
    end 

    def create
        note = Note.create(note_params)

        if note 
            render json: note 
        else 
            render json: note.errors.messages
        end 
    end 





    private

    def note_params
        params.require(:note).permit(:date, :message, :foodtruck_id)
    end 
end
