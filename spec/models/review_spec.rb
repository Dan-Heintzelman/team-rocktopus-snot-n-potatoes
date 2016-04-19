describe Review do
  let(:review) { Review.new(rating: 8) }
  let(:user) { User.create(username: 'ian', password:'123', email: 'ian')}
  let(:movie) { Movie.create(title: 'asdflj')}

  it "no reviews at instantiation" do
    expect(Review.count).to eq (0)
  end

  it "creates a review with a rating" do
    expect(review.rating).to eq(8)
  end

  it "has a review in the database after one is created" do
    Review.create!(user: user, movie: movie, rating: 5)
    expect(Review.count).to eq(1)
  end
end
