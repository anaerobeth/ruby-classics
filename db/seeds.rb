# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'CSV'

# Seed postings
posting_records = {}

CSV.foreach('db/data/posting.csv', headers: true) do |row|
  posting_records[row[0]] = {
    :title => row['title'],
    :description => row['description'],
    :url => row['url'],
    :user_id => row['user_id'].to_i,
    :category => row['category']
  }
end

posting_records.each do | key, values |
  record = Posting.where({
    url: key
  }).first

  if record.nil?
    record = Posting.new(values)
  else
    record.attributes = values
  end

  record.save!
end


#Seed users
user_records = {}

CSV.foreach('db/data/user.csv', headers: true) do |row|
  user_records[row[0]] = {
    :user_name => row['user_name'],
    :first_name => row['first_name'],
    :last_name => row['last_name'],
    :email => row['email'],
    :password => row['password'],
    :password_confirmation => row['password_confirmation'],
  }
end

user_records.each do | key, values |
  record = User.where({
    user_name: key
  }).first

  if record.nil?
    record = User.new(values)
  else
    record.attributes = values
  end

  record.save!
end


# Seed profiles
profile_records = {}

CSV.foreach('db/data/profile.csv', headers: true) do |row|
  profile_records[row[0]] = {
    :user_id => row['user_id'].to_i,
    :about_me => row['about_me'],
    :twitter => row['twitter'],
    :github => row['github'],
    :blog => row['blog'],
    :website => row['website'],
    :hometown => row['hometown'],
    :for_hire => row['for_hire'],
    :for_pairing => row['for_pairing']
  }
end

profile_records.each do | key, values |
  record = UserProfile.where({
    user_id: key
  }).first

  if record.nil?
    record = UserProfile.new(values)
  else
    record.attributes = values
  end

  record.save!
end



# Seed recommendations
recommendation_records = {}

CSV.foreach('db/data/recommendation.csv', headers: true) do |row|
  recommendation_records[row[0]] = {
    :user_id => row['user_id'],
    :posting_id => row['posting_id']
  }
end

recommendation_records.each do | key, values |
  record = Recommendation.where({
    user_id: key,
    posting_id: key
  }).first

  if record.nil?
    record = Recommendation.new(values)
  else
    record.attributes = values
  end

  record.save!
end


# Seed reviews
review_records = {}

CSV.foreach('db/data/review.csv', headers: true) do |row|
  review_records[row[0]] = {
    :user_id => row['user_id'],
    :posting_id => row['posting_id'],
    :body => row['body']
  }
end

review_records.each do | key, values |
  record = Review.where({
    user_id: key,
    posting_id: key
  }).first

  if record.nil?
    record = Review.new(values)
  else
    record.attributes = values
  end

  record.save!
end