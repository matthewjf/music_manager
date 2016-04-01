class NotesController < ApplicationController
  before_action :logged_in_user, only: :create
  before_action only: :destroy do
    admin_or_correct_user(Note.find(params[:id]).user)
  end

  def create
    @track = Track.find(params[:track_id])
    @note = @track.notes.build(note_params)
    @note.user = current_user

    if @note.save
      flash[:success] = "Note added, congratulations!"
    end
    redirect_to @track
  end

  def destroy
    Note.find(params[:id]).destroy
    flash[:success] = "note deleted"
    redirect_to :back
  end

  private

    def note_params
      params.require(:note).permit(:text, :user_id, :track_id)
    end

end
