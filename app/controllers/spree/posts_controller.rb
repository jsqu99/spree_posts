module Spree
  class PostsController < BaseController
    before_filter { render_404 if params[:id] =~ /(\.|\\)/ }

    caches_action :show, :if => Proc.new { Config[:cache_static_content] }, :layout => false

    respond_to :html

    def index      
      if params[:tag]
        @posts = Post.published.tagged_with(params[:tag]).page(params[:page]).per(4)
      else
        @posts = Post.published.page(params[:page]).per(4)
      end
      sidebar
    end

    # GET /pages/about-us
    def show
      @post = Post.published.find_by_permalink(params[:id])
      sidebar
    end

    def current_order
      
    end

    private
    def sidebar
      #@authors = Post.joins(:admin_user).select("COUNT(*) AS count, admin_users.first_name AS first_name, admin_users.last_name AS last_name").group("admin_users.id")
      @categories = Post.published.tag_counts

      #@archive = Post.select("COUNT(*) AS post_count, YEAR(published_at) AS year, MONTHNAME(published_at) AS month, MONTH(published_at) AS month_num").where("published_at <= ?", Time.now)
      #@archive_years = @archive.group("YEAR(published_at)").order("published_at DESC")
      #@archive_months = @archive.group("MONTHNAME(published_at)").group("YEAR(published_at)").order("published_at ASC")
    end

    
  end
end
