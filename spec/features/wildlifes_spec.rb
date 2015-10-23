require 'rails_helper'

describe "Wildlifes" do

  context "when I visit wildlifes" do
    before do
      visit(root_path)
    end
    it "should list all wildlifes" do
      binding.pry
    end
  end
end
