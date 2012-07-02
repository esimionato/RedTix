Redtix::Application.routes.draw do
  resource :organization
  root :to => 'welcome#index'
end
