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
end
