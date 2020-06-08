Dummy::Application.routes.draw do
  # scope module: 'wcc_style' do
    # get "pages/welcome", path: "/welcome"
    # get "pages/about", path: "/about"
    # get "pages/accessibility", path: "/accessibility"
  # end
# 

  resources :resources do
    collection do
      post :search, to: 'resources#search'
    end
  end
  
  resources :keywords
  
  root 'wcc_style/pages#welcome'
  
  mount WccStyle::Engine, at: '/wcc_style'
end
