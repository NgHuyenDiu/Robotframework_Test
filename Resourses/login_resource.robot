*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/login.py
Variables    ../Locators/header.py
Resource    ../Resourses/header_resources.robot
*** Keywords ***

Enter email
    [Arguments]    ${email}
    input text    ${locate_email}   ${email}

Enter password
    [Arguments]    ${password}
    input text    ${locate_password}    ${password}

Click the login button
    click element    ${locate_login_button}

Click the checkbox remember me
    click element    ${locate_ckeckbox_remember_me}

Verify go to home page
    location should be    https://demo.nopcommerce.com/

Verify wrong email
    page should contain    Wrong email
    ${email}    get text    ${locate_email_error}
    log to console    ${email}

Verify message error
    page should contain     Login was unsuccessful. Please correct the errors and try again.
    ${error}    get text    ${locate_error_message}
    log to console    ${error}

Verify password empty
    page should contain     Login was unsuccessful. Please correct the errors and try again.
    ${error}    get text    ${locate_error_message}
    log to console    ${error}

Verify email empty
    page should contain    Please enter your email
    ${email}    get text    ${locate_email_error}
    log to console    ${email}



Login with a VALID account
    [Arguments]    ${email}     ${password}
    login_resource.Enter email     ${email}
    login_resource.Enter password    ${password}
    Click the login button
    Verify go to home page
    Verify my acount link button display
    Verify log out link button display

Login VALID account with remember me
    [Arguments]    ${email}     ${password}
    login_resource.Enter email     ${email}
    login_resource.Enter password    ${password}
    select checkbox    ${locate_ckeckbox_remember_me}
    Click the login button
    Verify go to home page
    Verify my acount link button display
    Verify log out link button display

Login with a email incorrect fomat
    [Arguments]    ${email}
    login_resource.Enter email     ${email}
    Click the login button
    Verify wrong email

Login with all field empty
    Click the login button
    Verify email empty

Login with a email blank
    [Arguments]    ${password}
    login_resource.Enter password    ${password}
    Click the login button
    Verify email empty

Login with a password blank
    [Arguments]    ${email}
    login_resource.Enter email     ${email}
    Click the login button
    Verify password empty

Login with a INVALID account
    [Arguments]    ${email}     ${password}
    login_resource.Enter email     ${email}
    login_resource.Enter password    ${password}
    Click the login button
    Verify message error



log in using URL of the userlogged in
    [Arguments]    ${email}     ${password}
    login_resource.Enter email     ${email}
    login_resource.Enter password    ${password}
    Click the login button
    ${new_url}  get location

    # open incognito windown
    ${options}=    Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${options}    add_argument    incognito
    Create WebDriver    Chrome    chrome_options=${options}
#    Execute Javascript    window.open('')
    Go To    ${new_url}
    page should contain    ${login_linkbutton}