module ApplicationHelper
    def authenticated_user?
        if current_user == @post.user
        # my_link_to
        create_post
       
        end
    end

     def create_post
     posts= current_user.posts.all
     end
    # def my_link_to
#     link_to "delete", @post, method: :delete, data: { confirm: "You sure?" }
#     end

end
