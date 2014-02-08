require 'spec_helper'

module MyExpenses
  describe ViewHelpers do
    include MyExpenses::ViewHelpers

    it "should set error message" do
      show_error_message.should eq nil
      @error = "Error"
      show_error_message.should eq "<p class='lead text-danger spacer'>Error</p>"
    end

    it "should set success message" do
      show_success_message.should eq nil
      @success = "Success"
      show_success_message.should eq "<p class='lead text-success spacer'>Success</p>"
    end
  end
end
