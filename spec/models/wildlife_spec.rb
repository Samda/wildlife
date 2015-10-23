require 'rails_helper'

describe Wildlife do
  describe "associations" do 
    it { should have_many(:pictures)}
  end
end
