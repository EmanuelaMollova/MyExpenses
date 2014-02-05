module MyExpenses
  module ViewHelpers
    def show_error_message
      "<p class='lead text-danger spacer'>#{@error}</p>" if @error
    end

    def show_success_message
      "<p class='lead text-success spacer'>#{@success}</p>" if @success
    end
  end
end
