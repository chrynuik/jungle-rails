require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be valid with all fields' do
      user = User.new(first_name: 'catherine', last_name: 'H', email: 'test@example.com', password: 'testtest', password_confirmation: 'testtest')
      expect(user).to be_valid
      user.destroy
    end

    it 'should be not be valid without first_name' do
      user = User.new( last_name: 'H', email: 'test@example.com', password: 'testtest', password_confirmation: 'testtest')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include('First name can\'t be blank')
    end

    it 'should be not be valid without last_name' do
      user = User.new( first_name: 'catherine', email: 'test@example.com', password: 'testtest', password_confirmation: 'testtest')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include('Last name can\'t be blank')
    end

    it 'should be not be valid without email' do
      user = User.new( first_name: 'catherine', last_name: 'H', password: 'testtest', password_confirmation: 'testtest')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include('Email can\'t be blank')
    end

    it 'should be not be valid without password' do
      user = User.new( first_name: 'catherine', last_name: 'H', email: 'test@example.com', password_confirmation: 'testtest')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include('Password can\'t be blank')
    end

    it 'should be not be valid without password confirmation' do
      user = User.new( first_name: 'catherine', last_name: 'H', email: 'test@example.com', password: 'testtest')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include('Password confirmation can\'t be blank')


    end

    it 'should be not be valid without matching password and password confirmation' do
      user = User.new( first_name: 'catherine', last_name: 'H', email: 'test@example.com', password: 'testtest', password_confirmation: 'Testtest')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include('Password confirmation doesn\'t match Password')

    end

    it 'should be not be valid with same email' do
      user = User.create!( first_name: 'catherine', last_name: 'H', email: 'test@example.com', password: 'testtest', password_confirmation: 'testtest')
      user2 = User.new( first_name: 'C', last_name: 'H', email: 'Test@example.com', password: 'testtest', password_confirmation: 'testtest')
      expect(user).to be_valid
      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to include('Email has already been taken')
      user.destroy
    end

    it 'should be not be valid without a long enough password' do
      user = User.new( first_name: 'catherine', last_name: 'H', email: 'test@example.com', password: 'test', password_confirmation: 'test')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include('Password is too short (minimum is 8 characters)')
    end
  end
  describe '.authenticate_with_credentials' do
    it 'should authenticate' do
      user = User.create!( first_name: 'catherine', last_name: 'H', email: 'test1@example.com', password: 'testtest', password_confirmation: 'testtest')
      expect(user).to be_valid
      authenticate_user = User.authenticate_with_credentials('test1@example.com', 'testtest')
      expect(authenticate_user).to be == user
      user.destroy
    end

    it 'should authenticate without case sensivity of email' do
      user = User.create!( first_name: 'catherine', last_name: 'H', email: 'test1@example.com', password: 'testtest', password_confirmation: 'testtest')
      expect(user).to be_valid
      authenticate_user = User.authenticate_with_credentials('Test1@example.com', 'testtest')
      expect(authenticate_user).to be == user
      user.destroy
    end

    it 'should not authenticate without case sensivity of password' do
      user = User.create!( first_name: 'catherine', last_name: 'H', email: 'test1@example.com', password: 'testtest', password_confirmation: 'testtest')
      expect(user).to be_valid
      authenticate_user = User.authenticate_with_credentials('test1@example.com', 'testTest')
      expect(authenticate_user).to be nil
      user.destroy
    end

    it 'should not authenticate with the wrong email' do
      user = User.create!( first_name: 'catherine', last_name: 'H', email: 'test1@example.com', password: 'testtest', password_confirmation: 'testtest')
      expect(user).to be_valid
      authenticate_user = User.authenticate_with_credentials('testing@example.com', 'testest')
      expect(authenticate_user).to be nil
      user.destroy
    end

    it 'should not authenticate with the wrong password' do
      user = User.create!( first_name: 'catherine', last_name: 'H', email: 'test1@example.com', password: 'testtest', password_confirmation: 'testtest')
      expect(user).to be_valid
      authenticate_user = User.authenticate_with_credentials('test1@example.com', 'catsdogs')
      expect(authenticate_user).to be nil
      user.destroy
    end

    it 'should authenticate even with whitespace around the email' do
      user = User.create!( first_name: 'catherine', last_name: 'H', email: 'test1@example.com', password: 'testtest', password_confirmation: 'testtest')
      expect(user).to be_valid
      authenticate_user = User.authenticate_with_credentials('  test1@example.com  ', 'testtest')
      expect(authenticate_user).to be == user
      user.destroy
    end

  end
end
