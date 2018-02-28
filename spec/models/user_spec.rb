require "rails_helper"

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_presence_of(:email)}
  end

  describe "relationships" do
    it {is_expected.to have_many(:orders)}
  end

  describe "roles" do
    it "can be created as admin" do
      kyle = User.create!(username: "kyle",
                           password: "password",
                           email: "email@gmail.com",
                           role:  1)

        expect(kyle.role).to eq("admin")
        expect(kyle.admin?).to be_truthy
    end
  end

  describe "roles" do
    it "can be created as registered" do
      bob = User.create!(username: "bob",
                          password: "password",
                          email: "email@gmail.com"
                          )

      expect(bob.role).to eq("default")
      expect(bob.admin?).to_not be_truthy
    end
  end
end
