class MembersController < ApplicationController

  before_action :authenticate_user!
  before_action :is_admin
  before_action :set_member, only: [:destroy,:member_todos]

     def index()
       if is_admin()
        @members = User.all
       else
        redirect_to root_path
       end
     end

    def destroy()
      @member.destroy
      flash[:danger]= 'The user has been deleted succesfully';
      redirect_to members_path()
    end

private

    def set_member
      @member = User.find(params[:id])
    end

=begin
      Check if the user have administrator rights
      then pass the user object to the destroy method
=end

    def is_admin()
       @user = current_user if current_user.admin == true;
    end

end
