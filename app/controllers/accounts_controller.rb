class AccountsController < ApplicationController
    def show
        @account = Account.find(params[:id])
    end

    def new
        @account = Account.new
    end        

end
