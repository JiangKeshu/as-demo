Asdemo::App.controllers :console do
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  
  get :index do
    render 'console/index'
  end

  post "/startload" do
    $elb = params[:elb]
    $concurrency = params[:concurrency]
    `startload.sh #{$concurrency} #{$elb}`
  end

  post "/stopload" do
    `stopload.sh`
  end

end
