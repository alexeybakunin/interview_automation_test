module Pages
  
  class RegistrationForm < SitePrism::Section
    
    element :sso_login_facebook, '.sso-buttons__button__facebook'
    element :email, '#email'
    element :password, '#password'
    element :postcode, '#zipcode'
    element :add_to_mailing_list, :xpath, '//div[input[@id="user[marketing_opt_in]-1"]]'
    element :dont_add_to_mailing_list,  :xpath, '//div[input[@id="user[marketing_opt_in]-0"]]'
    element :privacy_policy, 'a[href="/privacy"]'
    element :submit, '#email-signup-form-submit'
    elements :registration_errors, '.session__errors ul li'
    element :single_error, '.session__errors'
    expected_elements :email,
                      :password,
                      :postcode,
                      :add_to_mailing_list,
                      :dont_add_to_mailing_list,
                      :privacy_policy_btn,
                      :submit_form,
                      :sso_login_facebook
  end
  
  class RegistrationPage < SitePrism::Page
    set_url '/signup'
    section :registration_form, Pages::RegistrationForm, '.session__container'
  end
end
