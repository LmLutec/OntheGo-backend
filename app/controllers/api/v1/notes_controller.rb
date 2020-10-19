class Api::V1::NotesController < ApplicationController
    def index
    end 

    def create
        note = Note.create(note_params)

        if note.valid?
            render json: note 
        else 
            render json: note.errors.messages
        end 
    end 

    def destroy
        note = Note.find_by(id: note_params[:id])
        if note.valid?
            note.destroy
        end 
    end 

    private

    def note_params
        params.require(:note).permit(:id, :date, :message, :foodtruck_id)
    end 

end
