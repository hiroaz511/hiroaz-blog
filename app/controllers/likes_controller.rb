class LikesController < ApplicationController
 before_action :authenticate_user

 def create
 	@like=Like.new(user_id: @current_user.id, article_id: params[:article_id])
 	@like.save
 	if request.path_info == '/articles'
 		redirect_to("/articles")
 	else
 		redirect_to("/articles/#{params[:article_id]}")
	end
 end

 def destroy
 	@like = Like.find_by(user_id: @current_user.id, article_id: params[:article_id])
    @like.destroy
    if request.path_info == '/articles'
 		redirect_to("/articles")
 	else
 		redirect_to("/articles/#{params[:article_id]}")
	end
 end

end