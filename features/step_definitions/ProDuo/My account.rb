When(/^user is on Create account page$/) do
  @browser.title.include?' mon compte | PRO-DUO'
end

Then(/^Select Private person option$/) do
  @browser.element(:id, 'b2c-register').click
end

Then(/^Select civility from the dropdown (.*)$/) do |greeting|
  @browser.element(:id, 'dwfrm_profile_customer_b2c_salutationSelectBoxIt').wait_until_present.click
  @browser.element(:link_text, (greeting)).click
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
  @browser.text_field(:id, 'dwfrm_profile_customer_b2c_qas_intuitiveAddress').wait_until_present.set(address)
  ad
  @browser.element(:class, 'address-suggestions').wait_until_present.text.include? (address[/(.*)\s/,1])
  @browser.element(:class, 'address-suggestions').element(:class, 'suggestion').click
end


And(/^Click on Create account button button$/) do
  @browser.execute_script('arguments[0].scrollIntoView();', @browser.element(:class, 'valider-b2c'))
  @browser.execute_script('javascript:window.scrollBy(0,-100)')
  sleep (1)
 @browser.element(:class, 'valider-b2c').wait_until_present.click
  @browser.element(:class, 'account-title-landing').wait_until_present.text.include? 'Bienvenue'+ ' ' + @first_name
end

Then(/^user fills valid landline number$/) do
  @browser.text_field(:id, 'dwfrm_profile_customer_b2c_phone').set('01'+@phone)
 
end

And(/^Check the newsletter subscription checkbox$/) do
  @browser.execute_script('javascript:window.scrollBy(0,250)')
  @browser.element(:xpath, ".//*[@id='personalForm']/div[13]/div[1]/div[1]/span/label").click
end

And(/^Select a checkbox from the preferences$/) do
  @browser.element(:xpath, ".//*[@id='personalForm']/div[13]/div[2]/div[1]/span/label").wait_until_present.click
  @browser.element(:xpath, ".//*[@id='personalForm']/div[13]/div[2]/div[2]/span/label").wait_until_present.click
  @browser.element(:xpath, ".//*[@id='personalForm']/div[13]/div[2]/div[4]/span/label").wait_until_present.click
  @browser.element(:xpath, ".//*[@id='personalForm']/div[13]/div[2]/div[3]/span/label").wait_until_present.click
end

Then(/^Check the SMS checkbox$/) do
  @browser.element(:xpath, ".//*[@id='personalForm']/div[13]/div[3]/div[1]/span/label").click
end

When(/^Click on add a company checkbox$/) do
  @browser.element(:xpath, ".//*[@id='shippingbillingForm']/div/div[1]/div[3]/div[12]/div[1]/span/label").click
end

Then(/^Select county (.*) from the country dropdown$/) do |country|
  @browser.execute_script('javascript:window.scrollBy(0,350)')
  @browser.element(:id, 'dwfrm_profile_customer_b2c_addressbilling_vatCountrySelectBoxIt').click
  @browser.element(:id, 'dwfrm_profile_customer_b2c_addressbilling_vatCountrySelectBoxItOptions').element(:link_text, (country)).click
end

And(/^Fill in the VAT field with a valid number (.*)$/) do |vat|
  @browser.text_field(:id, 'dwfrm_profile_customer_b2c_addressbilling_vatNumber').set(vat)
end


When(/^Click on use a different shipping address checkbox$/) do
  @browser.element(:xpath, ".//*[@id='shippingbillingForm']/div/div[1]/div[3]/div[18]/div[1]/span/label").click
end

Then(/^Start typing address2 in the address  suggestion field (.*)$/) do |address2|
  @browser.element(:class,"shipping-address").text_field(:id, 'dwfrm_profile_customer_b2c_qas_intuitiveAddress').wait_until_present.set(address2)
  @browser.element(:class, 'address-suggestions').wait_until_present
  @browser.element(:class, 'address-suggestions').element(:class, 'suggestion').click
end

Then(/^Select Professional option$/) do
  @browser.element(:id, 'b2b-register').click
end

Then(/^Select civility from the dropdown\-list B2B (.*)$/) do |greeting|
  sleep (1)
  @browser.element(:id, 'dwfrm_profile_customer_b2b_generalfields_personalData_salutationSelectBoxItText').wait_until_present.click
  @browser.element(:link_text, (greeting)).click
end

And(/^Fill ds in the first name field for B2B (.*)$/) do |firstname|
  @first_name = firstname
  @browser.text_field(:id, 'dwfrm_profile_customer_b2b_generalfields_personalData_firstName').set(firstname)
end

And(/^Fill ds in the last name field for B2B (.*)$/) do |lastname|
  @browser.text_field(:id, 'dwfrm_profile_customer_b2b_generalfields_personalData_lastName').set(lastname)
end

And(/^Fill in with a valid email address for B2B$/) do
  @browser.text_field(:id, 'dwfrm_profile_customer_b2b_generalfields_personalData_email').set(@email+'@gmail.com')
end

And(/^Confirm the email address for B2B$/) do
  @browser.text_field(:id, 'dwfrm_profile_customer_b2b_generalfields_personalData_confirmemail').set(@email+'@gmail.com')
end

Then(/^Fill in with a phone number for B2B$/) do
  @browser.text_field(:id, 'dwfrm_profile_customer_b2b_generalfields_personalData_cellphone').set('06'+@phone)
end

And(/^Check the newsletter subscription checkbox for B2B$/) do
  @browser.element(:xpath,".//*[@id='step1']/div[11]/div[1]/div[1]/span/label").click
end

Then(/^Check the SMS checkbox for B2B$/) do
  @browser.element(:xpath, ".//*[@id='step1']/div[11]/div[2]/div[1]/span/label").click
end

Then(/^Fill in with a valid password for B2B$/) do
  @browser.text_field(:id, 'dwfrm_profile_customer_b2b_generalfields_loginData_password').set(@pass)
end

Then(/^Confirm the password for B2B$/) do
  @browser.text_field(:id, 'dwfrm_profile_customer_b2b_generalfields_loginData_passwordconfirm').set(@pass)
end

When(/^Click on continue button for B2B$/) do
  @browser.execute_script('javascript:window.scrollBy(0,350)')
  @browser.element(:class, 'get-next').click
end


Then(/^Select the salon owner profession (.*) from the dropdown B2B$/) do |ownew|
  sleep(2)
  @owner = ownew
  @browser.execute_script('javascript:window.scrollBy(0,150)')
  @browser.element(:id, "dwfrm_profile_customer_b2b_generalfields_professionalData_customerTypeSelectBoxIt").click
  @browser.link(:text,@owner).click
 end

Then(/^user press on an activity checkbox for B2B$/) do
  @browser.element(:xpath, ".//*[@id='step3']/div/div[2]/div/div/div[1]/span/label").click
  @browser.element(:xpath, ".//*[@id='step3']/div/div[2]/div/div/div[2]/span/label").click
  @browser.element(:xpath, ".//*[@id='step3']/div/div[2]/div/div/div[3]/span/label").click
  @browser.element(:xpath, ".//*[@id='step3']/div/div[2]/div/div/div[4]/span/label").click
end

Then(/^user selects country (.*) from VAT drop\-down for B2B$/) do |country|
  @browser.element(:id, 'dwfrm_profile_customer_b2b_company_vatCountrySelectBoxItText').click
  @browser.element(:id, 'dwfrm_profile_customer_b2b_company_vatCountrySelectBoxItOptions').element(:link_text, (country)).click
end

Then(/^user fills the VAT field for B2B with (.*)$/) do |vat|
  @browser.text_field(:id, 'dwfrm_profile_customer_b2b_company_vatNumber').set(vat)
end


And(/^user fills the Société field with some data (.*)$/) do |data|
  @browser.text_field(:id, 'dwfrm_profile_customer_b2b_generalfields_professionalData_organization').set(data)
end

And(/^user fills with some text (.*) in the name of the salon field for B2B$/) do |saloneName|
  @browser.text_field(:id, "dwfrm_profile_customer_b2b_generalfields_professionalData_salonName").set(saloneName)
end

Then(/^typing address in the address suggestion field for B2B (.*)$/) do |address|
  @browser.text_field(:id, "dwfrm_profile_customer_b2b_generalfields_addressQas_intuitiveAddress").set(address)
  @browser.element(:class, 'address-suggestions').element(:class, 'suggestion').wait_until_present.text.include? (address[/(.*)\s/,1])
  @browser.element(:class, 'address-suggestions').element(:class, 'suggestion').wait_until_present.click
  @browser.execute_script('javascript:window.scrollBy(0,450)')
end


When(/^press on use a different shipping address checkbox for B2B$/) do
  @browser.element(:xpath, ".//*[@id='addressArea_address']/div[16]/div[1]/span/label").click
end

Then(/^Start typing address2 for B2B in the address suggestion field (.*)$/) do |address2|
  #@browser.execute_script('javascript:window.scrollBy(0,150)')
  @browser.execute_script('arguments[0].scrollIntoView();',  @browser.element(:id,"divShippingAddress").text_field(:id, "dwfrm_profile_customer_b2b_generalfields_shipping_qas_intuitiveAddress"))
  @browser.execute_script('javascript:window.scrollBy(0,-150)')
  @browser.element(:id,"divShippingAddress").text_field(:id, "dwfrm_profile_customer_b2b_generalfields_shipping_qas_intuitiveAddress").wait_until_present.set(address2)
  @browser.element(:class, 'address-suggestions').element(:class, 'suggestion').wait_until_present.text.include? (address2[/(.*)\s/,1])
  @browser.element(:class, 'address-suggestions').element(:class, 'suggestion').wait_until_present.click
 end

And(/^click on validate button for B2B$/) do
  sleep(2)
  @browser.element(:class, "step-validate").wait_until_present.click
  @browser.element(:class, "confirmation-msg-b2b").wait_until_present

end


Then(/^user uploads document (.*) the proof section B2B Salon employee$/) do |docpath|
  @browser.file_field(:id, 'dwfrm_profile_customer_b2b_employee_proof').set(docpath)
end

And(/^fill the phone number landline number for B2B first address$/) do
  @browser.text_field(:id, 'dwfrm_profile_customer_b2b_generalfields_addressData_address_phone').set('01'+@phone)
end


And(/^user fills valid birthday for B2C (.*),(.*),(.*)$/) do |month, date , year|
  @browser.text_field(:id, "dwfrm_profile_customer_b2c_birthDay").wait_until_present.set(month)
  @browser.text_field(:id, "dwfrm_profile_customer_b2c_birthMonth").wait_until_present.set(date)
  @browser.text_field(:id, "dwfrm_profile_customer_b2c_birthYear").wait_until_present.set(year)
end

And(/^user fills valid birthday for B2B (.*), (.*), (.*)$/) do |date, month, year|
  @browser.text_field(:id, "dwfrm_profile_customer_b2b_generalfields_personalData_birthDay").set(date)
  @browser.text_field(:id, "dwfrm_profile_customer_b2b_generalfields_personalData_birthMonth").set(month)
  @browser.text_field(:id, "dwfrm_profile_customer_b2b_generalfields_personalData_birthYear").set(year)
end