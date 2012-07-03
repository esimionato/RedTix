class OrganizationsController < OrganizationBaseController
  skip_before_filter :load_organization, only: [:new, :create]

  def new
    @organization = Organization.new
    @organization.subdomain = session[:available_subdomain] if session[:available_subdomain].present?
  end

  def create
    @organization = Organization.new(params[:organization])
    if @organization.save
      flash[:success] = 'Organization created successfully. Check your email for further information'
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @organization = Organization.find_by_subdomain!(request.subdomain)
  end
end
