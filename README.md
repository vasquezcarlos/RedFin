# redfin.com filtering test
Test the redfin.com filtering

Use Redfin to test the following scenarios using Ruby, Cucumber, and Capybara:
1. Signing in with valid username and password. Verify that you are signed in.
2. Searching for a property in a city with at least 3 filters. Verify that you 
   get results back and that each result matches your criteria.

How to run this test:
    1. Clone repository:
        git clone https://github.com/vasquezcarlos/redfin
    2. Bring up the command line console
    3. cd to "cucumber_project" directory
    4. Type "cucumber features/red_search.feature" and press enter
    5. The test goes through a series of features that call a series of steps which includes:
       a. Validate that a user signs in with valid username and password
       b. Validate the search results after creating a search criteria
       
    Note: number of beds, baths, sqft, and price were hardcoded I could have use a functions which randomly
       selects each item in the dropdown.

