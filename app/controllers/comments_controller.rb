class CommentsController < ApplicationController

  belongs_to :sotre, :counter_cache => "comments_count"
  belongs_to :user

  validates_presence_of :content

end
