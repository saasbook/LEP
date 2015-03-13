Before do
  OmniAuth.config.test_mode = true
  Capybara.current_driver = :selenium
end

After do
  OmniAuth.config.test_mode = false 
  Capybara.use_default_driver
  DatabaseCleaner.clean_with(:truncation)
end
