get '/posts/all' do
@all_post = Post.all

erb :'posts/show_all'
end


get '/posts/create_new' do

  erb :'posts/create_new'
end

post "/posts/create_new/succes" do
  tag = params[:tag].split(", ")
  post = Post.create(title: params[:title], body: params[:body])
  tag.each do |tag|
      unless Tag.exists?(:name => tag)
        Tag.create(name: tag)
      end
      tag_obj = Tag.where(name: tag).first
      post.tags<<tag_obj
    end
    redirect 'posts/all'
end



get '/posts/:post_id' do
  @post = Post.find(params[:post_id])

  erb :'posts/show_one_post'
end

get '/posts/edit/:post_id' do
  @post = Post.find(params[:post_id])

  erb :'posts/edit_post'
end


post "/posts/edit_post/succes/:id" do
  tag = params[:tag].split(", ")
  post = Post.find(params[:id])
  post.title = params[:title]
  post.body = params[:body]
  tag.each do |tag|
      unless Tag.exists?(:name => tag)
        Tag.create(name: tag)
      end
      tag_obj = Tag.where(name: tag).first
      post.tags<<tag_obj
    end
  post.save
  redirect 'posts/params[:id]'
end

get '/posts/delete/:id' do
  post = Post.find(params[:id])
  post.destroy

  redirect '/posts/delete_success/'
end

get '/posts/delete_success/' do
"succesfully deleted"
end