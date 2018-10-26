require "rails_helper"

describe "Top Commenters view", type: :request do
  describe "shows the page" do
    it 'displays title' do 
      visit '/top10'
      expect(page).to have_selector("h1", text: "Top Commenters of this week")
    end
  end
  describe "shows table with amounts" do 
    before do
      20.times do 
        create(:movie)
      end
      @user = create(:user)
      10.times do |i| 
        @user.comments.create!(
          content: Faker::Lorem.sentence,
          movie_id: (i+1)
        )
      end
      10.times do |i|
        @user.comments.create!(
          created_at: Faker::Time.between(2.weeks.ago, 1.week.ago),
          content: Faker::Lorem.sentence, 
          movie_id: (i+11)
        )
      end
    end

    it 'displays a table with amount of comments' do
      visit '/top10'
      expect(page).to have_selector(
        "td.amount",
        count: 1, 
        text: "#{@user.comments.where(created_at: (DateTime.now-7.day)..(DateTime.now)).count}"
      )
    end
  end
end