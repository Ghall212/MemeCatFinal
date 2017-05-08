require 'rails_helper.rb'

feature"User creates an account and navigates to other pages" do
    scenario "User successfully navigates to the sign up page" do
        visit root_path
        expect(page).to have_content("Browse Memes")
        click_link "Sign Up"
        expect(page).to have_content("Sign Up")
        expect(page).to have_field("Username")
        expect(page).to have_field("Password")
        expect(page).to have_field("Password confirmation")
    end
    
    scenario "User successfully creates a new account" do
        visit new_account_path
        expect(page).to have_content("Sign Up")
        fill_in "Username", with: "Mason"
        fill_in "Password", with: "masonmason"
        fill_in "Password confirmation", with: "masonmason"
        click_button "Sign Up"
        expect(page).to have_content("Your Recent Uploads")
    end
    
    scenario "User successfully navigates to the upload image page" do
        visit new_account_path
        expect(page).to have_content("Sign Up")
        fill_in "Username", with: "Mason"
        fill_in "Password", with: "masonmason"
        fill_in "Password confirmation", with: "masonmason"
        click_button "Sign Up"
        expect(page).to have_content("Your Recent Uploads")
        click_link "Home"
        expect(page).to have_content("Welcome")
        click_link "Upload Meme"
        expect(page).to have_content("New Upload")
    end
    
    scenario "User successfully logs out of their account" do
        visit new_account_path
        expect(page).to have_content("Sign Up")
        fill_in "Username", with: "Mason"
        fill_in "Password", with: "masonmason"
        fill_in "Password confirmation", with: "masonmason"
        click_button "Sign Up"
        expect(page).to have_content("Your Recent Uploads")
        click_link "Profile"
        click_link "Log out"
        expect(page).to have_content("Welcome")
    end
end