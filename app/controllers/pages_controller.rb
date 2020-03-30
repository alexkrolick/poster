class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard, :admin]
  before_action :admin_only, only: :admin

	def index
    @no_footer = true

    if !user_signed_in?
      @no_nav = true

    else
      @posts = Post.primary
      .includes(:tags, :uploads, :user)
      .last(3)
      .reverse
      @tags = @posts.map(&:tags).flatten
      render 'dashboard'
    end
	end

  def dashboard
    @posts = current_user.posts.primary.include(:tags)
  end

  def admin
  end

end
