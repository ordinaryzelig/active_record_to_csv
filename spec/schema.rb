require 'sqlite3'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

ActiveRecord::Schema.define do
  create_table :movies, :force => true do |t|
    t.string :title
    t.integer :director_id
    t.timestamps
  end
end
