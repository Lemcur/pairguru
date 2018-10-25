class TopcommentersController < ApplicationController
  def index
    @commenters = User.joins(:comments)
                    .where("comments.created_at BETWEEN ? AND ?",DateTime.now - 7.day, DateTime.now)
                    .select("users.id, users.email, COUNT (comments.id) AS amount")
                    .group(:user_id)
                    .order("amount DESC")
                    .limit(10)
  end
end
