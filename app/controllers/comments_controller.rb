class CommentsController < ApplicationController
  before_action :authorized, only: [:show]
  before_action :set_comment , only:[:show, :edit, :destroy]

    def create
        @user = current_user
        @gossip = Gossip.find(params[:comment][:gossip_id])
        @comment = Comment.new(content: params[:comment][:content], user_id:@user.id, gossip_id: @gossip.id)
    
        if @comment.save
          redirect_to gossip_path(@gossip.id)
        else
          @comment.errors.full_messages.each do |message|
          end
        render gossip_path(@gossip.id)
        end
      end
    
      def edit
        @comment = Comment.find(params[:id])
      end
      


      def update
        @comment = Comment.find(params[:id])
        if @comment.update(content: comment_params[:content])
            redirect_to gossip_path(@comment.gossip_id)
          else
            render :new
          end
      end
    
      def destroy
        @comment.destroy
        redirect_to gossip_path(@comment.gossip_id)
      end

      private 

    def set_comment
        @comment = Comment.find(params[:id]) 
    end    
      
      def comment_params
        comment_params = params.require(:comment).permit(:content)
      end

    end