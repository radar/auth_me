module AuthMe::Controllers::SignIn
  class Perform
    include AuthMe::Action

    def call(params)
      transaction = AuthMe::Transactions::Users::SignIn.new
      transaction.call(params[:user]) do |result|
        result.success do |user|

          sign_in(user)

          flash[:notice] = "You have signed in successfully."
          redirect_to '/'
        end

        result.failure do
          flash[:alert] = "Invalid email or password."
        end
      end
    end
  end
end
