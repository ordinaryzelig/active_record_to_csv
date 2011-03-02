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
      Movie.create!(
        :title => title,
        :director_id => i + 1,
        :released_on => Date.new(2010, 1, i + 1)
      )
    end
  end

  it 'should convert records to csv' do
    Movie.to_csv.should eq(content_of(fixtures_file('movies.csv')))
  end

  it' should preserve scope' do
    Movie.bad.to_csv.should eq(content_of(fixtures_file('movies_bad.csv')))
  end

  it 'should not include id and timestamp fields' do
    header = Movie.to_csv.lines.first
    header.should_not =~ /^id|created_at|updated_at/
  end

  it 'should call to_csv on each attribute if it responds to it' do
    date = Movie.limit(1).first.released_on
    csv_string = Movie.limit(1).to_csv
    csv_string.should include(date.to_csv)
    csv_string.should_not include(date.to_s)
  end

end
