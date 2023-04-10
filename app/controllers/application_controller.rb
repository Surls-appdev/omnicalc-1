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
