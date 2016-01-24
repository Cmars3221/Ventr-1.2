class MessagesController < ApplicationController

	before_action :find_message, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show, :splash]
  
  #@messages is plural, we're getting multiple messages. Also will be ordered from lastest to oldst post via the .order (DESC) method
    def index
    	@messages = Message.all.order("created_at DESC")
    end

    def show
    	
 	
    end
# This will show the message of the user id thown into this find method.
# Then display it in your show.html.erb (if you created one)


    def new
    	@message = current_user.messages.build
    end

     # new message built with current user.

    def create
       @message = current_user.messages.build(message_params)
         if @message.save
          redirect_to root_path   
         else 
          render 'new' 
         end 
    end

         def edit
         	 	
         end

         def update
         	if @message.update(message_params)
         		redirect_to message_path
         	else
         		render 'edit'
            end
         end

         # update just redirects to the post, simiilar to create action. 

         def destroy

         	@message.destroy
         	redirect_to root_path

         end

         def splash
         end

   
          # (message params) the contents of the submitted form ends up in here.
    	  # the create action doesn't have a particular page, thus it requires Message.new
    	  # the submit on a form field, activates a redirect to post the form contents to where you desire.
          # root is  messages#index
    private

      # these params are for security.   
     def message_params
     	params.require(:message).permit(:title, :description)
     end

     def find_message
     	@message = Message.find(params[:id])
     end
           # linked to show action via the before_action helper. 

end
