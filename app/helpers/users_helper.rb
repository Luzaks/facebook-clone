module UsersHelper

    def gravatar_for(current_user)
        gravatar_id = Digest::MD5::hexdigest(current_user.email.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        image_tag(gravatar_url, alt: current_user.name, class: "gravatar")
      end
end
