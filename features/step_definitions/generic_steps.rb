Then /^I should see error messages$/ do
  page.should have_content('prohibited')
end

When /^show me the page$/ do
  save_and_open_page
end
