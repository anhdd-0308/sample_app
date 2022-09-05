class StaticPagesController < ApplicationController
  def home
    return unless logged_in?

    @micropost = current_user.microposts.build
    @search = current_user.feed.ransack(params[:q])
    @pagy, @feed_items = pagy @search.result.newest,
                              items: Settings.paginate.limit
  end

  def help; end

  def about; end

  def contact; end
end
