class Public::FavoritesController < ApplicationController

  def create
    record = Record.find(params[:record_id])
    @favorite = current_user.favorites.new(record_id: record.id)
    @favorite.save
    render 'replace_btn'
  end

  def destroy
    record = Record.find(params[:record_id])
    @favorite = current_user.favorites.find_by(record_id: record.id)
    @favorite.destroy
    render 'replace_btn'
  end

end
