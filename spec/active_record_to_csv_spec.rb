require 'spec_helper'

describe ActiveRecordToCSV do

  before :all do
    [
      'Black Swan',
      'Inception',
      'The Fighter',
      "The King's Speech",
      'The Kids Are All Right'
    ].each_with_index do |title, i|
      Movie.create! :title => title, :director_id => i
    end
  end

  it 'should convert records to csv' do
    Movie.to_csv.should eq(content_of(fixtures_file('movies.csv')))
  end

  it' should preserve scope' do
    Movie.bad.to_csv.should eq(content_of(fixtures_file('movies_bad.csv')))
  end

  it 'should not include id and timestamp fields' do
    Movie.to_csv.lines.first.should eq("title,director_id\n")
  end

end
