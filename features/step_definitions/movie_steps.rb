# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
  #flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
 
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  flunk "Unimplemented"
end

When /^I (uncheck|check) the following ratings: (.*)$/ do |uncheck, rating_list|
  rating_list.split(',').each do |field|
    field = "ratings_" + field.to_s.gsub(/'|\s/,'')
    uncheck == "uncheck" ? uncheck(field) : check(field)
  end
end

When /^I (uncheck|check) all ratings$/ do |uncheck|
  Movie.all_ratings.each do |field|
    field = "ratings_" + field.to_s.gsub(/'|\s/,'')
    uncheck == "uncheck" ? uncheck(field) : check(field)
  end
end

And /^I press 'ratings_submit'$/ do
  click_button('ratings_submit')
end

And /^I should (not see|see) movies with the following ratings: (.*)$/ do |uncheck, rating_list|
  rating_list.split(',').each do |field|
    field = "<td>" + field.to_s.gsub(/'|\s/,'') + "</td>"
    uncheck == "not see" ? (page.body.should_not match(field)) : (page.body.should match(field))
  end
end 

Then /^I should see all of the movies$/ do
  Movie.all.length.should == page.body.scan(/<td><a href=/).length
end

Then /^movies should be sorted by 'title'$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^movies should be sorted by 'release_date'$/ do
  pending # express the regexp above with the code you wish you had
end