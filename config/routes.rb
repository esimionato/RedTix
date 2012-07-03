Redtix::Application.routes.draw do
  resource :organization

  constraints(OrganizationSubdomain) do
    match '/' => 'organizations#show'
  end

  root :to => 'welcome#index'
end
