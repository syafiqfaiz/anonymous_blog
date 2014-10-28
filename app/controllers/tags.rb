get '/tag/:tag_id' do
  tag = Tag.find(params[:tag_id])
  @all_post = tag.posts

  erb :'posts/show_all'
end