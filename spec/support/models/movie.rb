class Movie < ActiveRecord::Base
  scope :bad, where(:title  => 'The Kids Are All Right')
end
