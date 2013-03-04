module Spree
  class Post < ActiveRecord::Base
  
    attr_accessible :title, :meta_keywords, :meta_description, :body, :permalink, :published, :published_at, :tag_list
    validates :title, :presence => true
    validates :permalink, :uniqueness => true
    scope :published, where(:published => true).order("created_at desc")
    #scope :latest, arel_table[:published_at].lteq(DateTime.now)
    paginates_per 50

    acts_as_taggable

    
  end
end
