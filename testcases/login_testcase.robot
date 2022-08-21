*** Settings ***
Library    SeleniumLibrary
Resource    ../Resourses/login_resource.robot
Resource    ../Resourses/common_resources.robot
Test Setup       open my browser     ${url}   ${browser}
Test Teardown    close my browser
Force Tags    Login

*** Variables ***
${url}    https://demo.nopcommerce.com/login
${browser}      chrome
${firefoxdriver}      D:/thuctap/testcase_demo/driver/geckodriver.exe
${email_valid}      abc123@gmail.com

*** Test Cases ***

Verify that the user can log in successfully with a VALID account.
    [Tags]    LOGIN-001
    Login with a VALID account      ${email_valid}       123456

Verify that the user cannot log in with incorrect format email.
    [Tags]    LOGIN-002
    Login with a email incorrect fomat  abc

Verify that the user cannot log in with BLANK Email and Password.
    [Tags]    LOGIN-003
    Login with all field empty

Verify that an error message displays when the user leaves the "Email" field BLANK.
    [Tags]    LOGIN-004
    Login with a email blank    123456

Verify that an error message displays when the user leaves the "Password" field BLANK.
    [Tags]    LOGIN-005
    Login with a password blank    ${email_valid}

Verify that the user cannot log in with incorrect information.
    [Tags]    LOGIN-006
    Login with a INVALID account    ${email_valid}   123675

Verify that other computers/browsers cannot login with the URL provided by logged in user.
    [Tags]    LOGIN-007
    Login with a VALID account      ${email_valid}       123456
    ${url_copy}    get location
    Open Browser     ${url_copy}   firefox   executable_path=${firefoxdriver}
    page should contain element    ${login_linkbutton}

Verify that session is NOT saved when user unchecked Remember me checkbox before logging in.
    [Tags]    LOGIN-008
    Login with a VALID account      ${email_valid}       123456
    go to   https://demo.nopcommerce.com/
    page should contain element    ${login_linkbutton}
    click element    ${login_linkbutton}

Verify that the user's information is saved after the session when remember me is selected
    [Tags]    LOGIN-009
    Login VALID account with remember me    ${email_valid}   123456
    sleep    3
    go to   https://demo.nopcommerce.com/
    sleep    3
    page should contain element    ${myacccount_headerlink}
    click element    ${myacccount_headerlink}


Verify that Login page cannot display when already logged in user.
    [Tags]    LOGIN-010
    log in using URL of the userlogged in    ${email_valid}   123456


