require 'rails_helper'

describe "Wildlifes" do

  context "when visit root path" do
    let!(:wildlifes){ create_list(:wildlife, 3) }
    before do
      visit(root_path)
    end

    it "should list all wildlifes" do
      page.should have_content(wildlifes.last.name)
    end

    context "when click view detail" do
      let(:bear){create(:wildlife, name: "Bear")}
      before do
        visit wildlife_path(bear)
      end

      it "should show animal details" do
        page.should have_content(bear.name)
        page.should have_content(bear.description)
      end
    end
  end

  describe "crud" do
    let(:asserted_attributes){
      { name: "Tiger",
        description: "Run very fash and eat a lot.",
        speed: "522",
      }
    }

    def fill_out_form
      fill_in 'Name', with: asserted_attributes[:name]
      fill_in 'Description', with: asserted_attributes[:description]
      fill_in 'Speed', with: asserted_attributes[:speed]
    end

    before do
      visit new_wildlife_path
      fill_out_form
      click_button('Create Wildlife')
    end

    context "add new animal" do
      it "animal should show in list" do
        expect(page).to have_content(asserted_attributes[:name])
        expect(page).to have_content(asserted_attributes[:description])
      end
    end

    context "update" do
      let(:tiger) { create(:wildlife, name: "Monkey", description: "Like jump on tree") }
      before do
        visit edit_wildlife_path(tiger)
        fill_out_form
        click_button('Update Wildlife')
      end

      it "should update animal info" do
        expect(page).to have_content(asserted_attributes[:name])
        expect(page).to have_content(asserted_attributes[:description])
      end
    end
  end
end
