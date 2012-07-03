def visit_with_subdomain(subdomain, path)
  Capybara.default_host = "#{subdomain}.redtix.dev"
  Capybara.app_host = "http://#{subdomain}.redtix.dev"

  visit path
end
