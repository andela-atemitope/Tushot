class LinksController < ApplicationController
  def index
    @link = Link.new
    @most_recent_links = Link.all.most_recent_links.limit(4)
    @most_popular_links = Link.all.most_popular_links.limit(4)
    @count = Link.all.count
  end


  def create
    @link = Link.new(link_params)
    if @link.save
      current_user.links << @link if current_user
        if params[:link][:short_url]  &&  (@link.short_url != params[:link][:short_url])
          flash[:notice] = "that bullet is already chosen but we generated a new one for you"
        else
          flash[:notice] = "Link successfully created"
        end
    else
      render :index
      flash[:notice] = "Error generating Link, Try Again"
    end
  end


  def show
    @link = Link.find_by(short_url: params[:id])

    if @link
      @link.clicks += 1
      @link.save
      redirect_to @link.long_url
    else 
      redirect_to root_url,
      flash[:notice] = "Link doesnt exist"
    end
  end

  def dashboard

  end

  def new 
  end

  def edit
  end

  private
  #specifying only trusted parameters from the Internet
    def link_params
      params.require(:link).permit(:long_url, :short_url)
    end
end
