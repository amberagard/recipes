require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    it "should have the content 'Recipes'" do
      visit '/static_pages/home'
      expect(page).to have_content('Recipes')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("Recipe Tracker")
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('| Home')
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("Recipe Tracker | Help")
    end
  end

  describe "About page" do
    it "should have the content 'About'" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end

    it "should have the title 'About'" do
      visit '/static_pages/about'
      expect(page).to have_title("Recipe Tracker | About")
    end
  end

  describe "Recipes page" do
    it "should have the content 'Recipes'" do
      visit '/static_pages/recipes'
      expect(page).to have_content('Recipes')
    end

    it "should have the title 'Recipes'" do
      visit '/static_pages/recipes'
      expect(page).to have_title("Recipe Tracker | Recipes")
    end
  end
end