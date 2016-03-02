class ApplesController < ApplicationController
  def lp_a_start_form
    @apple = Apple.new
    @apples = Apple.all
  end
  
  def create
    @apple = Apple.new(apple_params)
    @apple.save

    liqpay = Liqpay::Liqpay.new(
      :public_key  => 'i35395571497',
      :private_key => 'irj04vFv5A7g7pdVVdJ59ja5nh79U5IlylVQk8jQ'
    )    
    
    def encode_json(params)
      JSON.generate(params)
    end    
    
    def encode64(params)
      (Base64.encode64 params).chomp.delete("\n")
    end
    
    def cnb_form_request(params = {}, liqpay)
      params[:public_key] = 'i35395571497'
      json_params = encode64 encode_json params
      signature = liqpay.cnb_signature params            
      "https://liqpay.com/api/3/checkout?data=#{json_params.to_s}&signature=#{signature.to_s}"
    end
      
    html = cnb_form_request({
      :version        => '3',
      :action         => 'pay',
      :amount         => '1',
      :currency       => 'UAH',
      :description    => 'description text',
      :details        => 'Details',
      :server_url     => '/lp_d_server',
      :result_url     => '/lp_c_result',
      :sandbox        => '1'        
    }, liqpay)                                  

    redirect_to html
        
  end
  
  def lp_c_result
  end

  def lp_d_server
  end

  def lp_e_end
  end          
  
  
  
  def apple_params
    params.require(:apple).permit(:name)
  end      
end
