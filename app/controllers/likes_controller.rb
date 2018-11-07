class LikesController < ApplicationController
 before_action :authenticate_user

 def create
 	@like=Like.new(user_id: @current_user.id, article_id: params[:article_id])
 	@like.save
 	puts "!!!!!!!!!!!!!!!!!!!!!!" + request.path_info
 	puts "??????????????????????" + '/articles/#{article_id}/create'
 # 	if request.path_info == '/articles/#{article_id}/create'
 # 		puts "一覧ページにいます"
 		redirect_to("/articles")
 # 	else
 # 		puts "それ以外のページにいます"
 # 		redirect_to("/articles/#{params[:article_id]}")
	# end
 end

 def destroy
 	@like = Like.find_by(user_id: @current_user.id, article_id: params[:article_id])
    @like.destroy
    puts "!!!!!!!!!!!!!!!!!!!!!!1" + request.path_info
 #    if request.path_info == '/articles/#{@current_user.id}/create'
 #    	puts "一覧ページにいます"
 		redirect_to("/articles")
 # 	else
 # 		puts "それ以外のページにいます"
 # 		redirect_to("/articles/#{params[:article_id]}")
	# end
 end

#  def create
#  	@article=Article.find_by(params[:article_id])
#  	@article.like_user(@current_user)
#  	redirect_to("/articles")
#  end

#  def destroy
#  	@article = Like.find(params[:id]).article
#     @article.unlike_user(@current_user)
#     redirect_to("/articles")
#  end

end