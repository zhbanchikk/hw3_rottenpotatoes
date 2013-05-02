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

When /^I (un)?check the following ratings: (.*)$/ do |uncheck, rating_list|
  rating_list.split(',').each do |field|
    field = "ratings_" + field.to_s.gsub(/'|\s/,'')
    # why not works? uncheck = true && uncheck(field) || check(field)
    # why not works? uncheck == true ? uncheck(field) : check(field)
    if uncheck
      uncheck(field)
    else
      check(field)
    end
  end
end

When /^I (un)?check all ratings$/ do |uncheck|
  Movie.all_ratings.each do |field|
    field = "ratings_" + field.to_s.gsub(/'|\s/,'')
    check(field)
    uncheck = true && uncheck(field) || check(field)
  end
end

And /^I press 'ratings_submit'$/ do
  click_button('ratings_submit')
end

And /^I should (not )?see movies with the following ratings: (.*)$/ do |uncheck, rating_list|
  rating_list.split(',').each do |field|
    field = "<td>" + field.to_s.gsub(/'|\s/,'') + "</td>"
    # why not works? uncheck == true ? (page.body.should_not match(field)) : (page.body.should match(field))
    if uncheck
      page.body.should_not match(field)
    else
      page.body.should match(field)
    end
  end
end 

Then /^I should see (none|all) of the movies$/ do |uncheck|
  rows.should == value
end

Then /^I should see all of the movies$/ do
  pending # express the regexp above with the code you wish you had
end

  Movie.find(:all).length.should page.body.scan(/<tr>/).length


Then /^movies should be sorted by 'title'$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^movies should be sorted by 'release_date'$/ do
  pending # express the regexp above with the code you wish you had
end