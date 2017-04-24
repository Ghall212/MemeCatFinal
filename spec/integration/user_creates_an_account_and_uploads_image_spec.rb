require 'rails_helper.rb'

feature"User creates an account and uploads an image" do
    scenario "User successfully navigates to the sign up page" do
        visit root_path
        expect(page).to have_content("Recently Added")
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
        click_button "Create Account"
        expect(page).to have_content("Your Recent Uploads")
    end
    
    scenario "User successfully navigates to the upload image page" do
        visit root_path
        expect(page).to have_content("Recently Added")
        click_link "Upload Meme"
        expect(page).to have_content("New Upload")
        expect(page).to have_field("Title")
        expect(page).to have_field("Description")
    end
    
    scenario "User successfully creates a new account" do
        visit new_upload_path
        expect(page).to have_content("New Upload")
        fill_in "Title", with: "Test"
        fill_in "Description", with: "This is a test."
        # code to text upload file
        click_button "Create Upload"
        expect(page).to have_content("Your Recent Uploads")
    end
end