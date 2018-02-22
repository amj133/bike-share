require 'rails_helper'

describe Accessory, type: :model do
  describe "validatoins" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:price)}
  end
end
