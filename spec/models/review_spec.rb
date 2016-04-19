describe Review do
  let(:review) { Review.new(rating: 8) }

  it "no reviews at instantiation" do
    expect(Review.count).to eq (0)
  end

  it "creates a review with a rating" do
    expect(review.rating).to eq(8)
  end

  it "has a review in the database after one is created" do
    Review.create(rating: 5)
    expect(Review.count).to eq(1)
  end
end
