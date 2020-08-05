require 'rails_helper'

describe User do
  describe '#create' do
    before do
      @user = build(:user)
    end

    it 'is valid with a nick_name, email, password, password_confirmation' do
      expect(@user).to be_valid
    end

    it 'is invalid without nickname' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors[:nickname]).to include("can't be blank")
    end

    it 'is invalid without email' do
      @user.email = nil
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without @' do
      @user.email = 'sample.com'
      @user.valid?
      expect(@user.errors[:email]).to include('is invalid')
    end

    it 'is invalid with a duplicate email address' do
      another_user = @user.dup
      @user.save
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
    end

    it 'is invalid without a password_confirmation although with a password' do
      @user.password = ''
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'is invalid that has less than 5 characters ' do
      @user.password = '111aa'
      @user.valid?
      expect(@user.errors[:password]).to include('is invalid')
    end

    it 'is valid that has more than 6 characters ' do
      @user.password = '111aaa'
      expect(@user).to be_valid
    end

    it 'is invalid only numbers ' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors[:password]).to include('is invalid')
    end

    it 'is invalid only alphabets ' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors[:password]).to include('is invalid')
    end
  end
end
