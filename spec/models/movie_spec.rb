require 'rails_helper'

describe Movie do
  let(:movie) { Movie.new(title: "Deadpool", genre: "action", tagline: "Back for the first time", overview: "A comic book hero does stuff", photo_path: "/abc123.jpg", runtime: "240 min", release_date: "2015-12-22") }

  it "creates a movie with a title" do
    expect(movie.title).to eq('Deadpool')
  end

  it "creates a movie with a genre" do
    expect(movie.genre).to eq('action')
  end

  it "creates a movie with a tagline" do
    expect(movie.tagline).to eq('Back for the first time')
  end

  it "creates a movie with a overview" do
    expect(movie.overview).to eq('A comic book hero does stuff')
  end

  it "creates a movie with a photo_path" do
    expect(movie.photo_path).to eq('/abc123.jpg')
  end

  it "creates a movie with a runtime" do
    expect(movie.runtime).to eq('240 min')
  end

  it "creates a movie with a release_date" do
    expect(movie.release_date).to eq('2015-12-22')
  end

  it "exists in the database after creation" do
    Movie.create(title: 'Deadpool')
    expect(Movie.count).to eq(1)
  end


end
