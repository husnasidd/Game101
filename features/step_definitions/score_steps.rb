And (/I should see an image/) do 
  expect(page).to have_content(:image)
end

Given /I am done with the quiz/ do 
  visit "/questions/game/id"
end

Given /I have answered five questions/ do 
  visit "/questions/game/id"
end

Given /I want to continue/ do 
  visit "/questions/answer/id"
end


Given /^I have a "([^\"]+)" set to "([^\"]+)"$/ do |key, value|
  headers = {}
  Rack::Utils.set_cookie_header!(headers, key, value)
  cookie_string = headers['Set-Cookie']
  Capybara.current_session.driver.browser.set_cookie(cookie_string)
end

When /I am on question five/ do 
  within "questions#check_answer" do
    fill_in 'game_counter', :with => '5'
  end
end


Then /^(?:|I )should not see three answer choices/ do 
  if page.respond_to? :should
    page.should have_no_content("Choices")
  else
    assert page.has_no_content?("Choices")
  end
end