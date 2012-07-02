class OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(params[:organization])
    @organization.save

    redirect_to(root_path)
  end
end
