module ApplicationHelper

    def list_pending_friends(user)
        
        friendship_2 = @inverse_friendships.map{|friendship| friendship.user if !friendship.friendship_status}.compact
        friendship_2
    end
end
