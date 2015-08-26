class ArticlesController < ApplicationController
	def new
	end

	def index
		@articles = Article.all
	end

	def create
		# Gets form data
		@article = Article.new(params[:article])

		# Sves form data to DB
		@article.save
		# Redirects user to specified page
		redirect_to @article
	end

	def show
		# @article references the current instance object
		# .find looks for the article id we want
		@article = Article.find(params[:id])
	end
end
