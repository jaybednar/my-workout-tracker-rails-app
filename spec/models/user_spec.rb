require 'rails_helper'

RSpec.describe User, type: :model do

	before(:each) do
    User.destroy_all
  end

	let(:user) {User.create(name: "Tester", email: "test@test.com", password: "test")}

  it 'can create a new user' do 
  	User.create(name: "Tester", email: "test@test.com", password: "test")
  	expect(User.all.count).to eq(1)
  	expect(User.first.name).to eq("Tester")
  end 

  it 'validates for name' do
  	User.create(email: "test@test.com", password: "test")
  	User.create(name: "", email: "test@test.com", password: "test")
  	expect(User.all.count).to eq(0)
  end 

  it 'validates for email' do
  	User.create(name: "Tester", password: "test")
  	User.create(name: "Tester", email: "", password: "test")
  	expect(User.all.count).to eq(0)
  end 

  it 'validates for password' do
  	User.create(name: "Tester", email: "test@test.com")
  	expect(User.all.count).to eq(0)
  end 

 	it 'confirms the password' do
  	User.create(name: "Tester", email: "test@test.com", password: "test", password_confirmation: "test123")
  	expect(User.all.count).to eq(0)
  end


end
