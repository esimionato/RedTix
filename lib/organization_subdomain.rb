class OrganizationSubdomain
  def self.matches?(request)
    request.subdomain.present? && !Organization::EXCLUDED_SUBDOMAINS.include?(request.subdomain)
  end
end
