Given(/^I (am|should be) on a (\w+)$/) do |condition, page|
  page = @app.send(page)
  page.load if condition == 'am'
  expect(page).to be_displayed
end

Given(/^I select "(.*)" for offers and updates$/) do |mailing_agreement|
  choose(mailing_agreement, allow_label_click: true)
end

Given(/^I click on a submit registration button$/) do
  @app.registration_page.registration_form.submit.click
end

Given(/^next errors should be shown$/) do |table|
  expected_errors = table.rows_hash['errors'].split(',')
  actual_errors = if expected_errors.size > 1
                    @app.registration_page.registration_form.registration_errors.map{|element| element.text}
                  else
                    [@app.registration_page.registration_form.single_error.text]
                  end
  expect(actual_errors).to eq(expected_errors)
end

Given(/^I fill (\w+) field with "(.*)" value$/) do |element, value|
  @app.registration_page.registration_form.send(element).set value
end

Given(/^I fill email field with appropriate value$/) do
  @app.registration_page.registration_form.email.set Faker::Internet.email
end

Given(/^I fill password field with appropriate value$/) do
  @app.registration_page.registration_form.password.set Faker::Alphanumeric.alphanumeric(number: 10)
end

Given(/^I fill postcode field with appropriate value$/) do
  @app.registration_page.registration_form.postcode.set 'A99 9AA'
end

Given (/^I fill registration form with correct data$/) do
  steps %{
    Given I fill email field with appropriate value
    And I fill password field with appropriate value
    And I fill postcode field with appropriate value
  }
end

And(/^I click on a login with Facebook button$/) do
  @facebook_window = window_opened_by { @app.registration_page.registration_form.sso_login_facebook.click }
end

And(/^Facebook login window should be opened$/) do
  within_window @facebook_window do
    find('div.fb_content')
    expect(current_url).to match(/https:\/\/www\.facebook\.com\/login\.php/)
  end
end