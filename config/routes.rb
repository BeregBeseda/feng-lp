Rails.application.routes.draw do
  match '/',                      to: 'apples#lp_a_start_form', via: 'get'
  post '/apples',   to: 'apples#create'
  match '/lp_c_result',            to: 'apples#lp_c_result', via: 'get'  
  match '/lp_d_server',            to: 'apples#lp_d_server', via: 'get'    
  match '/lp_e_end',               to: 'apples#lp_e_end',    via: 'get'      
  
  root 'apples#lp_a_start_form' 
  
  #resources 'apples'
end
