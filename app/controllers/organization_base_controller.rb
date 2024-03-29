class OrganizationBaseController < ApplicationController
  before_filter :load_organization

  private

  def load_organization
    @organization = Organization.find_by_subdomain(request.subdomain)
    store_subdomain_and_redirect_to_new_organization unless @organization
  end

  def store_subdomain_and_redirect_to_new_organization
    session[:available_subdomain] = request.subdomain
    flash[:notice] = 'You visited a non-existent subdomain. It is available for your use if you wish to signup'
    redirect_to new_organization_url(subdomain: 'www') and return
  end
end
