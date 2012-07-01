class Organization < ActiveRecord::Base
  SUBDOMAIN_MAX_LENGTH = 50
  SUBDOMAIN_REGEX = /\A[a-z0-9][a-z0-9\-]+[a-z0-9]\Z/i

  attr_accessible :name, :subdomain

  validates :name,      presence: true

  validates :subdomain, format: { with: SUBDOMAIN_REGEX },
                        length: { maximum: 50 },
                        presence: true,
                        uniqueness: true
end
