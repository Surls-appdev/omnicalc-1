class ApplicationController < ActionController::Base
  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    #params = {"elephant"=>"42"}

    @num = params.fetch("elephant").to_f
    @square_of_num = @num ** 2
    render({ :template => "calculation_templates/square_results.html.erb"})
  end
  
  def blank_root_form
    render({ :template => "calculation_templates/root_form.html.erb"})
  
  end

  def calculate_root
      #params = {"root_number" ==> "number"}

      @root = params.fetch("root_number").to_f
      @root_of_num = Math.sqrt(@root) 

     render({ :template => "calculation_templates/root_result.html.erb"})

  end

  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb"})
  end

  def calculate_payment
    
    @apr_string = params.fetch("user_apr").to_f # used for the webpage, not the calculations
    @apr = params.fetch("user_apr").to_f/100
    @years = params.fetch("user_years").to_i
    @principal = params.fetch("user_pv").to_f
    @months = @years.to_f*12
    @mpr = @apr/12
    # @payment = (r(PV)/(1-(r+r)**-n))
    @r = (1+@mpr)**(@months)
    @numerator = @principal*@mpr*@r
    @denominator = (@r-1)
    @monthlypayment = @numerator/@denominator
    # PV = Present Value = 
    # r = rate per period = 
    # n = number of periods = @years*12
    
    render({ :template =>"calculation_templates/payment_calc.html.erb"})
  end

  def blank_random_form
    render({ :template => "calculation_templates/rand_form.html.erb"})
  end
  
  def calculate_random
    #params = {"min"=>"42"}
    #params = {"max"=>"420"}

    @lower = params.fetch("min").to_f
    @upper = params.fetch("max").to_f
    @result = rand(@lower..@upper)
    render({ :template =>"calculation_templates/rand_results.html.erb"})
  end

end
