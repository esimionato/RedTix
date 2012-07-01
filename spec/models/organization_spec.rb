require 'spec_helper'

describe Organization do
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

  allowed_mass_assigns = [ :name, :subdomain ]
  disallowed_mass_assigns = [ :created_at, :updated_at ]

  allowed_mass_assigns.each do |mass|
    it { should allow_mass_assignment_of(mass) }
  end

  disallowed_mass_assigns.each do |mass|
    it { should_not allow_mass_assignment_of(mass) }
  end
end
