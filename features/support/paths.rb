# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    when /^the (LEP )?home\s?page$/ then '/welcome/index'

    when /^the form page$/ then '/users/new'

    when /^the admin home page$/ then '/admins'

    when /^the users index page$/ then '/admins/2/users'

    when /^the view groups page$/ then '/users'
    
    when /^the timesheet home page$/ then '/users/1/timesheets'
    
    when /^the admin timesheet home page$/ then '/users/2/timesheets'
    
    when /^the invalid timesheet edit page$/ then '/users/1/timesheets/100'

    when /^\/users\/(.*)$/ then "/users/#{$1}"
    
    when /^the invalid page$/ then '/users/invalid'

    when /^the new user page$/ then '/users/new'
    
    when /^the admin show page$/ then '/admins/2'

    when /^the admin analytics page$/ then '/admins/1/analytics'
    
    when /^the existing user show page$/ then '/users/1'

    when /^the add group page$/ then '/groups/new'

    when /^the groups page$/ then '/groups'

    when /^I view pairs$/  then '/admins/2/pairs'

    when /^the pairs index page$/ then '/admins/2/pairs'

    when /^the language group page$/ then '/groups/4'

    when /^the edit group page$/ then '/groups/4/edit'

    when /^the new timesheet page$/ then '/users/1/timesheets/new'

    when /^\/users\/(.*)\/edit$/ then "/users/#{$1}/edit"

    when /^the pairs page$/ then "/admins/4/pairs"

    when /^the pairing page$/ then "/admins/1/pairs"

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)\'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
