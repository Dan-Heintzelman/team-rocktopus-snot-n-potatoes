require 'rails_helper'

describe Movie do
  let(:movie) { Movie.new(title: 'Deadpool', genre: "action") }

  it "creates a movie with a title" do
    expect(movie.title).to eq('Deadpool')
  end

  it "creates a movie with a genre" do
    expect(movie.genre).to eq('action')
  end

  it "exists in the database after creation" do
    Movie.create(title: 'Deadpool')
    expect(Movie.count).to eq(1)
  end


end
