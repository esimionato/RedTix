When /^I click on the shiny button to create my Organization$/ do
  find("a[rel='new-organization']").click
end

When /^I enter valid details$/ do
  org = FactoryGirl.build(:organization)
  fill_in('organization_name', with: org.name)
  fill_in('organization_subdomain', with: org.subdomain)
  click_button('Create Your Organization!')
end

Then /^I should see a successful organization creation$/ do
end
