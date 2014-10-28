get '/' do
  # Look in app/views/index.erb
  @all_post = Post.all
  @all_tag  = Tag.all
  erb :index
end



