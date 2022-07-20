class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

	def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'user'
			@list = User.search_for(@content, @method)
		else
			@list = Record.search_for(@content, @method)
		end
	end
end
