
module Spree
  class PostsController < BaseController
    before_filter { render_404 if params[:id] =~ /(\.|\\)/ }

    caches_action :show, :if => Proc.new { Config[:cache_static_content] }, :layout => false

    respond_to :html

    # GET /pages/about-us
    def show
      @page = Post.published.find_by_permalink(params[:id])
    end

    def current_order

    end

  end
end
