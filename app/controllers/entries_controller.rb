class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]


  def show
    @user = User.find(params[:user_id])
  end


  def new
    @entry = current_user.entries.build
  end


  def edit
  end


  def create
    @entry = current_user.entries.build(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to user_entry_path(current_user,@entry), notice: 'Entry was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to current_user.entries.present? ? user_path(current_user) : "/", notice: 'Ently was successfully destroyed.' }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:content)
    end
end
