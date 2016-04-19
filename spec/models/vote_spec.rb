describe Vote do

  it "has no votes at instantiation" do
    expect(Vote.count).to eq(0)
  end

  it "has a vote in the database after creation" do

    # where is a vote supposed to live? not sure how to test this

    # dan = User.create(username: 'dan', email: 'dan@dan.com')
    # review = Review.create(user: dan, rating: 8)
    # # movie = Movie.create(title: 'Star Wars')
    #
    # Vote.create(user: dan, review: review)
    #
    # expect(vote.count).to eq(1)
  end
end
