module Spree
  class Post < ActiveRecord::Base
  
    attr_accessible :title, :meta_keywords, :meta_description, :body, :permalink, :published, :published_at, :tag_list
    validates :title, :presence => true
    validates :permalink, :uniqueness => true
    #scope :published, where(:published => true).order("created_at desc")
    #scope :latest, arel_table[:published_at].lteq(DateTime.now)
    paginates_per 50

    acts_as_taggable

    scope :published, lambda { where(Post.arel_table[:published_at].lteq(DateTime.now)).order("created_at desc") }

    def self.archives year, month=nil
      if month && month > 0
        start_date = Date.new(year, month)
        end_date = start_date.end_of_month.next_day
      else
        start_date = Date.new(year)
        end_date = start_date.end_of_year
      end
      published.where(published_at: start_date..end_date)
    end

  end
end
