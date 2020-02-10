class Comments::LikesController < LikesController
    before_action :set_likeable
    
    def create
      super
    end
  
    private
  
      def set_likeable
        @likeable = Comment.find(params[:comment_id])
      end
  end