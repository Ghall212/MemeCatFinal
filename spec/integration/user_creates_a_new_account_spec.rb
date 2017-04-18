require 'rails_helper.rb'

feature"Blogger adds an article" do
    scenario "User successfully navigates to the sign up page" do
        visit root_path
        expect(page).to have_content("Recently Added")
        click_link "Sign Up"
        expect(page).to have_content("Sign Up")
        expect(page).to have_field("Username")
        expect(page).to have_field("Password")
    end
    
    scenario "User successfully creates a new account" do
        visit new_account_path
        expect(page).to have_content("Sign Up")
        fill_in "Username", with: "Mason"
        fill_in "Password", with: "masonmason"
        fill_in "Password_Confirmation", with: "masonmason"
        click_button "Create Account"
        expect(page).to have_content("Your Recent Uploads")
    end
end