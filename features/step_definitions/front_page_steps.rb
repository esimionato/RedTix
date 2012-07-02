When /^I visit the landing page$/ do
  visit(root_path)
end

Then /^I should see the site's welcome message$/ do
  within('section hgroup') do
    within('h1') do
      page.should have_content('Welcome to RedTix')
    end

    within('h2') do
      page.should have_content('The Last Development Tracker You Will Ever Need')
    end
  end
end

Then /^I should see the shiny button to create a company$/ do
  within('a.action-button.primary-action-button') do
    page.should have_content('Get Your Organization Created Now!')
  end
end

Then /^I should be on the landing page$/ do
    pending # express the regexp above with the code you wish you had
end

