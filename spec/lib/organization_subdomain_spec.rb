require 'spec_helper'

describe OrganizationSubdomain do
  describe '.matches?' do
    subject { OrganizationSubdomain }
    before(:each) do
      @request = double('request')
    end

    it { should respond_to(:matches?) }

    it 'should return false if subdomain is empty' do
      @request.stub(:subdomain).and_return('')
      OrganizationSubdomain.matches?(@request).should be_false
    end

    it 'should return false if subdomain is in excluded_subdomains' do
      Organization::EXCLUDED_SUBDOMAINS.each do |sub|
        @request.stub(:subdomain).and_return(sub)
        OrganizationSubdomain.matches?(@request).should be_false
      end
    end
  end
end
