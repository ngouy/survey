Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'questions'       => 'questions#index'
  get 'questions/:id'   => 'questions#show'

  get 'surveys'         => 'surveys#index'
  get 'surveys/:id'     => 'surveys#show'

  get 'feedbacks'       => 'feedbacks#index'
  get 'feedbacks/:id'   => 'feedbacks#show'


  get 'survey_trees/:id'       => 'surveys#tree'
  get 'question_sub_trees/:id' => 'questions#sub_tree'

end
