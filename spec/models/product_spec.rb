require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should be valid with all fields' do
      category = Category.create!(name: 'Clothes')
      product = Product.create!(name: 'Fancy coat', price: 20, quantity: 5, category: category)
      expect(product).to be_valid
    end
    it 'should not be valid without name' do
      category = Category.create!(name: 'Clothes')
      product = Product.new(price: 20, quantity: 5, category: category)
      expect(product).to_not be_valid

    end
    it 'should not be valid without a price' do
      category = Category.create!(name: 'Clothes')
      product = Product.new(name: 'Fancy coat', quantity: 5, category: category)
      expect(product).to_not be_valid

    end
    it 'should not be valid without a quantity' do
      category = Category.create!(name: 'Clothes')
      product = Product.new(name: 'Fancy coat', price: 20, category: category)
      expect(product).to_not be_valid
    end
    it 'should not be valid without a category' do
      product = Product.new(name: 'Fancy coat', quantity: 5, price: 20)
      expect(product).to_not be_valid
    end
  end
end
