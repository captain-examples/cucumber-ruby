Given("this will pass") do
  @this_will_pass = true
end

Given("this will fail") do
  @this_will_pass = false
end

When("I do an action") do
end

Then("some results should be there") do
  expect(@this_will_pass).to be true
end

Given("this is pending") do
  pending
end

Given /skip/ do
  skip_this_scenario
end

Before("@failing_before_hook") do |scenario|
  raise 'failed in before hook'
end

After("@failing_after_hook") do |scenario|
  raise 'failed in after hook'
end
