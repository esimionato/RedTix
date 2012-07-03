Given /^there is an Organization$/ do
  Organization.all.should be_empty

  FactoryGirl.create(:organization)
end

When /^I click on the shiny button to create my Organization$/ do
  find("a[rel='new-organization']").click
end

When /^I enter valid details$/ do
  org = FactoryGirl.build(:organization)
  fill_in('organization_name', with: org.name)
  fill_in('organization_subdomain', with: org.subdomain)
  click_button('Create Your Organization!')
end

When /^I enter invalid details$/ do
  click_button('Create Your Organization!')
end

When /^I visit the Organization's dashboard$/ do
  Organization.count.should == 1

  visit_with_subdomain(Organization.first.subdomain, root_path)
end

When /^I visit a subdomain that does not yet exist$/ do
  Organization.find_by_subdomain('non-existent').should be_nil

  visit_with_subdomain('non-existent', root_path)
end

Then /^I should see a successful organization creation$/ do
  within('#flash .success') do
    page.should have_content('Organization created successfully. Check your email for further information')
  end
end

Then /^I should be at the Organization signup page$/ do
  current_path.should == new_organization_path
end

Then /^I should see the subdomain already filled in for me$/ do
  find('#organization_subdomain').value.should == 'non-existent'
end

Then /^I should see a message that says that subdomain is available$/ do
  within('#flash .notice') do
    page.should have_content('You visited a non-existent subdomain. It is available for your use if you wish to signup')
  end
end

Then /^I should see the Organization's information$/ do
  Organization.count.should == 1

  within('#content h1') do
    page.should have_content(Organization.first.name)
  end
end
