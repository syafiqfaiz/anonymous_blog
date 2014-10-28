get '/posts' do

end


get '/post/create_new' do

  erb :'posts/create_new'
end

post "/posts/create-new/succes" do
  tag = params[:tag].split(", ")
  post = Post.create(title: params[:title], body: params[:body])
  tag.each do |tag|
      unless Tag.exists?(:name => tag)
        Tag.create(name: tag)
      end
      tag_id = Tag.find_by name: tag
      Link.create(tag_id: tag_id.id, post_id: post.id )

    end
end