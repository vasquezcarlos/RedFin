
# This function logins into the Redfin system using valid credentials

def redLogin()
  #fill the email text box
  'vasquezcarlos@gmail.com'.split('').each { |c| find_field('Email').native.send_keys(c) }
  #fill the password text box
  'Wse123ab!'.split('').each { |c| find_field('Password').native.send_keys(c) }
  #click on the Sign In button
  click_button 'Sign In'
end

