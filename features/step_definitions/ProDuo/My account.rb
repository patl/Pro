When(/^user is on Create account page$/) do
  @browser.title.include?' mon compte | PRO-DUO'
end

Then(/^Select Private person option$/) do
  @browser.element(:id, 'b2c-register').click
end

Then(/^Select civility from the dropdown$/) do
  @browser.execute_script('javascript:window.scrollBy(0,350)')
  @browser.element(:id, 'dwfrm_profile_customer_b2c_salutationSelectBoxIt').click
  @browser.element(:link_text, 'M.').click
end

And(/^Fill in the first name field (.*)$/) do |firstname|
  @first_name = firstname
  @browser.text_field(:id, 'dwfrm_profile_customer_b2c_firstName').set(firstname)
end

And(/^Fill in the last name field (.*)$/) do |lastname|
  @browser.text_field(:id, 'dwfrm_profile_customer_b2c_lastName').set(lastname)
end

And(/^Fill in with a valid email address$/) do
  @browser.text_field(:id, 'dwfrm_profile_customer_b2c_email').set(@email+'@gmail.com')
end

And(/^Confirm the email address$/) do
  @browser.text_field(:id, 'dwfrm_profile_customer_b2c_confirmemail').set(@email+'@gmail.com')
end

Then(/^Fill in with a phone number$/) do
  @browser.text_field(:id, 'dwfrm_profile_customer_b2c_cellphone').set('06'+@phone)
end

Then(/^Fill in with a valid password$/) do
  @browser.text_field(:id, 'dwfrm_profile_customer_b2c_password').set(@pass)
end

Then(/^Confirm the password$/) do
  @browser.text_field(:id, 'dwfrm_profile_customer_b2c_passwordconfirm').set(@pass)
end


When(/^Click on continue button$/) do
  @browser.execute_script('javascript:window.scrollBy(0,350)')
  @browser.element(:class, 'get-next-b2c').click
end

Then(/^Start typing address in the address suggestion field (.*)$/) do |address|
  @browser.text_field(:id, 'dwfrm_profile_customer_b2c_qas_intuitiveAddress').set(address)
  @browser.element(:class, 'address-suggestions').wait_until_present
  @browser.element(:class, 'address-suggestions').element(:class, 'suggestion').click
end


And(/^Click on Create account button  button$/) do
  @browser.execute_script('javascript:window.scrollBy(0,550)')
  @browser.element(:class, 'valider-b2c').click
  @browser.element(:class, 'account-title-landing').text.include? 'Bienvenue'+ ' ' + @first_name
end

Then(/^user fills valid landline number$/) do
  @browser.text_field(:id, 'dwfrm_profile_customer_b2c_phone').set('01'+@phone)
 
end

And(/^Check the newsletter subscription checkbox$/) do
  @browser.element(:xpath, ".//*[@id='personalForm']/div[13]/div[1]/div[1]/span/label").click
end

And(/^Select a checkbox from the preferences$/) do
  @browser.element(:xpath, ".//*[@id='personalForm']/div[13]/div[2]/div[1]/span/label").click
  @browser.element(:xpath, ".//*[@id='personalForm']/div[13]/div[2]/div[2]/span/label").click
  @browser.element(:xpath, ".//*[@id='personalForm']/div[13]/div[2]/div[4]/span/label").click
  @browser.element(:xpath, ".//*[@id='personalForm']/div[13]/div[2]/div[3]/span/label").click
end

Then(/^Check the SMS checkbox$/) do
  @browser.element(:xpath, ".//*[@id='personalForm']/div[13]/div[3]/div[1]/span/label").click
end

When(/^Click on add a company checkbox$/) do
  @browser.element(:xpath, ".//*[@id='shippingbillingForm']/div/div[1]/div[3]/div[12]/div[1]/span/label").click
end

Then(/^Select France from the country dropdown$/) do
  @browser.execute_script('javascript:window.scrollBy(0,350)')
  @browser.element(:id, 'dwfrm_profile_customer_b2c_addressbilling_vatCountrySelectBoxIt').click
  @browser.element(:id, 'dwfrm_profile_customer_b2c_addressbilling_vatCountrySelectBoxItOptions').element(:link_text, 'France').click
end

And(/^Fill in the VAT field with a valid number (.*)$/) do |vat|
  @browser.text_field(:id, 'dwfrm_profile_customer_b2c_addressbilling_vatNumber').set(vat)
end


When(/^Click on use a different shipping address checkbox$/) do
  @browser.element(:xpath, ".//*[@id='shippingbillingForm']/div/div[1]/div[3]/div[18]/div[1]/span/label").click
end

Then(/^Start typing address2 in the address  suggestion field (.*)$/) do |address2|
  @browser.element(:class,"shipping-address").text_field(:id, 'dwfrm_profile_customer_b2c_qas_intuitiveAddress').set(address2)
  @browser.element(:class, 'address-suggestions').wait_until_present
  @browser.element(:class, 'address-suggestions').element(:class, 'suggestion').click
end