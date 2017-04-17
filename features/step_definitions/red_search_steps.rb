require 'yaml'

pages = YAML.load_file('features/support/pages.yml')

Given(/^I am on Redfin$/) do
  # visit method goes to redfin.com specified Capybara.app_host in env.rb
  visit '/'
end

Given(/^I Login into Refin$/) do
  # Login into Redfin with valid credentials
  find(:xpath, pages['homePage']['loginLink']).click
  redLogin()
end

Then(/^I should see the logout link$/) do
  # expect to see photo selector after login
  expect(page).to have_selector(pages['loginData']['loginIcon'])
end
 
Given(/^I search for a property in a city$/) do
  # fill the property search box
  fill_in pages['search']['propertySearchField'], with: pages['search']['city']
  # click on the redfin search button
  find(:xpath, pages['search']['searchButton']).click
end
 
Then(/^I should be able to see a list of properties$/) do
  sleep(2)
  # validate user was redirected to the Search Result Page
  expect(page).to have_current_path(pages['search']['searchUrl'], url: true)
end

When(/^I use filters$/) do
  # change view to table
  find(:css, pages['search']['tableViewLink']).click
  # select four filters
  find(:css, pages['search']['priceDropDown']).click
  find(:xpath, pages['search']['priceItem']).click
  page.find(:css, pages['search']['filtersLink']).click
  select pages['minBeds'], :from => "minBeds"
  select pages['bathsListItem'], :from => "baths"
  select pages['minSqft'], :from => "sqftMin"
  select pages['minYearBuilt'], :from => "yearBuiltMin"
  # get total number of homes returned by the criteria
  sleep(5)
end

Then(/^Results should match criteria$/) do
  table = find(:css, 'table>tbody[class="tableList"]')
  rowCount = table.all(:css, 'tr').size

  for i in 0..rowCount-1
    # minimumPrice = (find(:css, pages['result']['returnedPrice']).text)
    minimumPrice = find(:css, "tr[id=\"ReactDataTableRow_#{i}\"] > td[class=\"column column_3 col_price\"]").text
    numberOfBeds = (find(:css, "tr[id=\"ReactDataTableRow_#{i}\"] > td[class=\"column column_4 col_beds\"]").text).to_i
    numberOfBaths = (find(:css, "tr[id=\"ReactDataTableRow_#{i}\"] > td[class=\"column column_5 col_baths\"]").text).to_i

    rawPrice = minimumPrice.delete('$ ,').to_i

    expect(rawPrice).to be >= (pages['minPrice']).to_i
    expect(numberOfBeds).to be >= (pages['minBeds']).to_i
    expect(numberOfBaths).to be >= (pages['numBaths']).to_i
  end

  # back to the list
  find(:css, pages['search']['updateSearchButton']).click
end
