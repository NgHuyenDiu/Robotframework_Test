*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../Resourses/login_resource.robot
Resource    ../Resourses/common_resources.robot
Resource    ../Resourses/register_resource.robot
Test Setup       open my browser     ${url}   ${browser}
#Test Setup      Create account with VALID information    M    Huyen      Diu     15      12      2000    abc123@gmail.com    123456      123456
Test Teardown    close my browser
Force Tags    Login

*** Variables ***
${url}    https://demo.nopcommerce.com/login
${browser}      chrome
${firefoxdriver}      D:/thuctap/testcase_demo/driver/geckodriver.exe


*** Test Cases ***

Verify that the user can log in successfully with a VALID account.
    [Tags]    LOGIN-001
    go to    https://demo.nopcommerce.com/register
    ${login}  Create account with VALID information email ramdom    M    Huyen      Diu     15      12      2000
    go to   https://demo.nopcommerce.com/login
    ${email_in}    get from list    ${login}   0
    ${password_in}      get from list    ${login}   1
    Login with a VALID account      ${email_in}       ${password_in}

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
    Login with a password blank    abc123@gmail.com

Verify that the user cannot log in with incorrect information.
    [Tags]    LOGIN-006
    Login with a INVALID account    abc123@gmail.com   123675

Verify that other computers/browsers cannot login with the URL provided by logged in user.
    [Tags]    LOGIN-007
    go to    https://demo.nopcommerce.com/register
    ${login}  Create account with VALID information email ramdom    M    Huyen      Diu     15      12      2000
    go to   https://demo.nopcommerce.com/login
    ${email_in}    get from list    ${login}   0
    ${password_in}      get from list    ${login}   1
    Login with a VALID account      ${email_in}       ${password_in}
    ${url_copy}    get location
    Open Browser     ${url_copy}   firefox   executable_path=${firefoxdriver}
    page should contain element    ${login_linkbutton}

Verify that session is NOT saved when user unchecked Remember me checkbox before logging in.
    [Tags]    LOGIN-008
    go to    https://demo.nopcommerce.com/register

    ${login}  Create account with VALID information email ramdom    M    Huyen      Diu     15      12      2000
    go to   https://demo.nopcommerce.com/login
    ${email_in}    get from list    ${login}   0
    ${password_in}      get from list    ${login}   1
    Login with a VALID account      ${email_in}       ${password_in}

    go to   https://demo.nopcommerce.com/
    page should contain element    ${login_linkbutton}


Verify that the user's information is saved after the session when remember me is selected
    [Tags]    LOGIN-009
    go to    https://demo.nopcommerce.com/register
    ${login}  Create account with VALID information email ramdom    M    Huyen      Diu     15      12      2000
    go to   https://demo.nopcommerce.com/login
    ${email_in}    get from list    ${login}   0
    ${password_in}      get from list    ${login}   1
    Login VALID account with remember me    ${email_in}       ${password_in}
    sleep    3
    go to   https://demo.nopcommerce.com/
    sleep    3
    page should contain element    ${myacccount_headerlink}
    click element    ${myacccount_headerlink}


Verify that users cannot log in to multiple accounts at the same time into the system.
    [Tags]    LOGIN-010
    go to    https://demo.nopcommerce.com/register
    ${login}  Create account with VALID information email ramdom    M    Huyen      Diu     15      12      2000

    go to   https://demo.nopcommerce.com/login
    ${email_in}    get from list    ${login}   0
    ${password_in}      get from list    ${login}   1
    Login with a VALID account      ${email_in}       ${password_in}

    Execute Javascript    window.open('')
    ${handles}=  Get Window Handles
    Switch Window   ${handles}[1]
    Go To    https://demo.nopcommerce.com/login
    sleep    5
    ${title_url}    get title
    log to console    ${title_url}
    should be equal    ${title_url}     nopCommerce demo store
    sleep    3

Verify that the user account will be locked if the wrong password is entered more than 3 times.
    [Tags]    LOGIN-011
    go to    https://demo.nopcommerce.com/register
    ${login}  Create account with VALID information email ramdom    M    Huyen      Diu     15      12      2000
    go to   https://demo.nopcommerce.com/login
    ${email_in}    get from list    ${login}   0
    ${password_in}      get from list    ${login}   1

    ${pass_fail_1}      set variable    ${password_in} + '1'
    ${pass_fail_2}      set variable    ${password_in} + '2'
    ${pass_fail_3}      set variable    ${password_in} + '3'
    ${pass_fail_4}      set variable    ${password_in} + '4'

    Login with a INVALID account    ${email_in}    ${pass_fail_1}
    Login with a INVALID account    ${email_in}    ${pass_fail_2}
    Login with a INVALID account    ${email_in}    ${pass_fail_3}
    Login with a INVALID account    ${email_in}    ${pass_fail_4}
    Login with a VALID account    ${email_in}       ${password_in}

    page should contain     locked
    ${title_login}      get title
    should be equal     nopCommerce demo store. Login


