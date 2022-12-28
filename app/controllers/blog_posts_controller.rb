class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: %i[show edit update destroy]
  before_action :check_admin, only: %i[edit update destroy new create]

  def index
    @blog_posts = BlogPost.all.order(:display_date)
  end

  def show; end

  def new
    @blog_post = BlogPost.new
  end

  def edit; end

  def create
    @blog_post = BlogPost.new(blog_post_params)

    if @blog_post.save
      redirect_to @blog_post, notice: 'Blog post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post, notice: 'Blog post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to blog_posts_url, notice: 'Blog post was successfully destroyed.'
  end

  private

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  end

  def check_admin
    redirect_to :new_user_session unless current_user&.admin?
  end

  # Only allow a list of trusted parameters through.
  def blog_post_params
    params.require(:blog_post).permit(:title, :body, :url)
  end
end
