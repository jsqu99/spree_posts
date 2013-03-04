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


    def find_by_archive

      @year = params[:year]
      @month = Date::MONTHNAMES[params[:month].to_i]
      @start_date = Date.new(params[:year].to_i, (params[:month].blank? ? 1 : params[:month].to_i))
      @end_date = params[:month] ? @start_date.end_of_month : @start_date.end_of_year
      @archive = params[:year].to_i
      @posts = Post.where(published_at: @start_date..@end_date).where(Post.arel_table[:published_at].lteq(DateTime.now)).page(params[:page]).per(8)
      
      sidebar
    end

    private
    def sidebar
      #@authors = Post.joins(:admin_user).select("COUNT(*) AS count, admin_users.first_name AS first_name, admin_users.last_name AS last_name").group("admin_users.id")
      @categories = Post.published.tag_counts
      @archive    = Post.all.group_by{ |x| x.published_at.year }.map{ |k, v| [ k, v.group_by{ |x| x.published_at.month }.map{|k,v| [k,v.count] } ] }
    end

    
  end
end


