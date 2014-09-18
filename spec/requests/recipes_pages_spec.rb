require 'spec_helper'

describe "Recipes pages" do
  subject { page }
  before do
    visit root_path
    click_link "Recipes"
  end

  describe "creating a new recipe" do
    before do
      click_link "Create New Recipe"
      fill_in "Name", with: "Cake"
    end

    it "should create a recipe" do
      expect { click_button "Create New Recipe" }.to change(Recipe, :count).by(1)
    end
  end
end
