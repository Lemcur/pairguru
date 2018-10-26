require "rails_helper"

describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:movie) { create(:movie) }

  context "Validations" do
    it { is_expected.to validate_presence_of :content }
    it "raises an error for 2nd comment for the same user and movie" do
      comment1 = Comment.create!(content: "asd", user: user, movie: movie)
      comment2 = Comment.new(content: "qwe", user: user, movie: movie)
      expect { comment2.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: User has already been taken")
    end
  end
  context "Associations" do 
    it { is_expected.to belong_to :movie }
    it { is_expected.to belong_to :user }
  end
end