require 'spec_helper'

describe Organization do
  before(:each) do
    FactoryGirl.create(:organization)
  end

  it { should have_db_column(:name).
              of_type(:string).
              with_options(null: false) }
  it { should have_db_column(:subdomain).
              of_type(:string).
              with_options(limit: 50, null: false) }
  it { should have_db_column(:created_at).
              of_type(:datetime).
              with_options(null: false) }
  it { should have_db_column(:updated_at).
              of_type(:datetime).
              with_options(null: false) }

  it { should have_db_index(:subdomain).unique(true) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:subdomain) }

  it { should ensure_length_of(:subdomain).
              is_at_most(Organization::SUBDOMAIN_MAX_LENGTH) }

  it { should validate_uniqueness_of(:subdomain) }

  allowed_mass_assigns = [ :name, :subdomain ]
  disallowed_mass_assigns = [ :created_at, :updated_at ]

  allowed_mass_assigns.each do |mass|
    it { should allow_mass_assignment_of(mass) }
  end

  disallowed_mass_assigns.each do |mass|
    it { should_not allow_mass_assignment_of(mass) }
  end

  valid_subdomains   = %W[ subdomain subdomain123 sub-domain 123subdomain 
                           sub123domain ]
  invalid_subdomains = %W[ sub_domain _subdomain_ _subdomain subdomain_ 
                           -subdomain- -subdomain subdomain- ]

  valid_subdomains.each do |sub|
    it { should validate_format_of(:subdomain).
                with(sub) }
  end

  invalid_subdomains.each do |sub|
    it { should validate_format_of(:subdomain).
                not_with(sub) }
  end
end
