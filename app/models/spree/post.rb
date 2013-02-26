module Spree
  class Post < ActiveRecord::Base
    
    attr_accessible :title, :meta_keywords, :meta_description, :body, :permalink, :published, :published_at
    validates :title, :presence => true
    validates :permalink, :uniqueness => true
    scope :published, where(:published => true).order("created_at desc")
    paginates_per 50

  end
end
