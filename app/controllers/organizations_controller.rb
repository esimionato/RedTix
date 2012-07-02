class OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
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
end
