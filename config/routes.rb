WccStyle::Engine.routes.draw do
  resources :pages, as: 'wcc_style_pages' do
    collection do
      get 'welcome'
      get 'about'
      get 'accessibility'
    end
  end
  
  root 'pages#welcome'
end
