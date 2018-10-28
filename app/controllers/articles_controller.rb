class ArticlesController < ApplicationController
	# http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
    # before_action :set_user
    # before_action :forbid_login_user, {only: [:login_form, :login]}


	def show
		@article = Article.find(params[:id])
		@user = @article.user
	end

	def new
		@article = Article.new
	end

	def index
		@articles = Article.all

	end


	def create
		# @article = Article.new(article_params)
		@article = Article.new(title: params[:title], text: params[:text], user_id: @current_user.id)
		# @article = Article.new(title: "What's up", text: "I love Japan", user_id: @current_user.id)
		# @user = User.find_by(id: params[:id])

	    if @article.save
	       flash[:notice] = "記事の投稿が完了しました"
       	   redirect_to @article
        else
           render 'new'
        end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		 @article = Article.find(params[:id])

		 if @article.update(article_params)
		 	flash[:notice] = "記事を編集しました"
		    redirect_to @article
	     else
		    render 'edit'
		 end
	end

	def destroy
		 @article = Article.find(params[:id])
		 @article.destroy
		 flash[:notice] = "記事を削除しました"

	     redirect_to articles_path
	end

private
  	def article_params
    	params.require(:article).permit(:title, :text)
    end
end
