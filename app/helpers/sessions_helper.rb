module SessionsHelper
    # Logs in the given account.
    def log_in(account)
        session[:account_id] = account.id
    end

    # Returns the current logged-in user (if any).
    def current_account
        @current_account ||= Account.find_by(id: session[:account_id])
    end
end
