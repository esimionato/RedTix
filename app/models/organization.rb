class Organization < ActiveRecord::Base
  SUBDOMAIN_MAX_LENGTH = 50
  SUBDOMAIN_REGEX = /\A[a-z0-9][a-z0-9\-]+[a-z0-9]\Z/i
  EXCLUDED_SUBDOMAINS = %W[ www admin ]

  attr_accessible :name, :subdomain

  validates :name,      presence: true

  validates :subdomain, exclusion: { in: EXCLUDED_SUBDOMAINS },
                        format: { with: SUBDOMAIN_REGEX },
                        length: { maximum: 50 },
                        presence: true,
                        uniqueness: true
end
