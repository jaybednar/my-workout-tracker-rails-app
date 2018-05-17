require 'rails_helper'

RSpec.feature "UserFeatures", type: :feature do
  
  describe 'home page' do 

  	before(:each) do 
  		visit '/'
  	end 

  	it 'has a button to create a new account' do 
  		expect(page).to have_content("Sign Up")
  	end 

  	it 'links to new_user_path' do 
  		click_on "Sign Up"
  		expect(current_path).to eq('/users/new')
  		expect(page.status_code).to be(200)
  	end 

  end 

  describe 'users#new' do 

  	before(:each) do 
  		visit '/users/new'
  	end 

 		it 'has a form to add a new user' do 
 			expect(page).to have_content("Create Your Account")
 			expect(page).to have_css('input#user_name')
 			expect(page).to have_css('input#user_email')
 			expect(page).to have_css('input#user_password')
 			expect(page).to have_css('input#user_password_confirmation')
 			expect(page).to have_css("input[name='commit']")
 		end 

 		it 'creates a new user' do 
 			fill_in('user_name', with: "TestUser")
      fill_in('user_email', with: "tester@test.com")
      fill_in('user_password', with: "test")
      fill_in('user_password_confirmation', with: "test")
      click_on('Create User')
      expect(current_path).to eq('/users/1')
      expect(User.all.count).to eq(1)
      expect(User.first.name).to eq("TestUser")
 		end 

 		# it 'logs the user in' do 
 		# 	fill_in('user_name', with: "TestUser")
   #    fill_in('user_email', with: "tester@test.com")
   #    fill_in('user_password', with: "test")
   #    fill_in('user_password_confirmation', with: "test")
   #    click_on('Create User')
   #    expect(logged_in?).to be(true)
   #  end 

 	end 

 	describe 'login page' do 

 		before(:each) do 
  		visit '/login'
  	end 

 		it 'has a form to log a user in' do 
 			expect(page).to have_content("Login to Your Account")
 			expect(page).to have_css('input#email')
 			expect(page).to have_css('input#password')
 			expect(page).to have_css("input[name='commit']")
 		end

 		it 'has link to login through Github' do 
 			expect(page).to have_content("Login via Github")
 		end 

 	end 


end
