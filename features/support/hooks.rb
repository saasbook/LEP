Before do
  Capybara.current_driver = :selenium
end

After do
  Capybara.use_default_driver
end
