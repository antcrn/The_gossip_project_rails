class GossipsController < ApplicationController
    before_action :authorized, except: [:show, :index]
    before_action :set_gossip , only:[:show, :edit, :destroy]
    # def gossip
    #     @gossips = Gossip.all
    # end

    def index
        @gossips = Gossip.all 
    end

    def show
        @comments = Comment.where(gossip_id:@gossip.id)
    end

    def new
        @gossip=Gossip.new() 
    end

    def create
        @user = current_user
        @gossip = Gossip.new(title:params[:gossip][:title], content:params[:gossip][:content], user_id:@user.id)
        if @gossip.save
            flash[:success] = "Potin bien créé !"
            redirect_to gossip_path(@gossip.id)
        else
            flash[:danger] = @gossip.errors.full_messages
            render :new
        end
    end

    def edit

    end

    def update
        @gossip = Gossip.find(params[:id]) 
        if @gossip.update(gossip_params)
            redirect_to gossip_path(@gossip.id)
          else
            render :new
        end
    end

    def destroy
      @gossip.destroy
      redirect_to gossips_path
    end

    private 

    def set_gossip
        @gossip = Gossip.find(params[:id]) 
    end    

    def gossip_params
        gossip_params = params.require(:gossip).permit(:title,:content)
    end
end
