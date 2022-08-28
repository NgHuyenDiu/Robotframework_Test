*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Resource    ../Resourses/password_resources.robot
Resource    ../Resourses/register_resource.robot
Resource    ../Resourses/login_resource.robot
Resource    ../Resourses/header_resources.robot
Resource    ../Resourses/common_resources.robot
Test Setup       open my browser     ${url}   ${browser}
Test Teardown    close my browser
Force Tags    Pass

*** Variables ***
${url}    https://demo.nopcommerce.com/register
${browser}      chrome
${firefoxdriver}      D:/thuctap/testcase_demo/driver/geckodriver.exe
*** Test Cases ***
Verify that the user can successfully change the password.
    [Tags]    PASSWORD-001
    ${login}  Create account with VALID information email ramdom    M    Huyen      Diu     15      12      2000
    go to   https://demo.nopcommerce.com/login
    ${email_in}    get from list    ${login}   0
    ${password_in}      get from list    ${login}   1
    Login with a VALID account      ${email_in}       ${password_in}
    click the my account link
    click link change password
    ${ramdom_pass}   Generate Random String  6
    Complete Change password    ${password_in}      ${ramdom_pass}      ${ramdom_pass}
    click the change password button
    sleep    2
    Verify change password success

Verify that the user can't change the password with an INVALID old password.
    [Tags]    PASSWORD-002
    ${login}  Create account with VALID information email ramdom    M    Huyen      Diu     15      12      2000
    go to   https://demo.nopcommerce.com/login
    ${email_in}    get from list    ${login}   0
    ${password_in}      get from list    ${login}   1
    ${pass_fail}    set variable    ${password_in} +'1'
    Login with a VALID account      ${email_in}       ${password_in}
    click the my account link
    click link change password
    ${ramdom_pass}   Generate Random String  6
    Complete Change password    ${pass_fail}      ${ramdom_pass}        ${ramdom_pass}
    click the change password button
    sleep    2
    Verify old password error message

Verify that the user can't change the password when a new password and confirm the password are not the same.
    [Tags]    PASSWORD-003
    ${login}  Create account with VALID information email ramdom    M    Huyen      Diu     15      12      2000
    go to   https://demo.nopcommerce.com/login
    ${email_in}    get from list    ${login}   0
    ${password_in}      get from list    ${login}   1
    Login with a VALID account      ${email_in}       ${password_in}
    click the my account link
    click link change password
    ${ramdom_pass}   Generate Random String  6
    ${pass_confirm}    set variable    ${password_in} +'1'
    Complete Change password    ${password_in}      ${ramdom_pass}      ${pass_confirm}
    click the change password button
    sleep    2
    Verify password do not match confirm password

Verify that an error message displays when the user leaves the required field BLANK.
    [Tags]    PASSWORD-004
    ${login}  Create account with VALID information email ramdom    M    Huyen      Diu     15      12      2000
    go to   https://demo.nopcommerce.com/login
    ${email_in}    get from list    ${login}   0
    ${password_in}      get from list    ${login}   1
    Login with a VALID account      ${email_in}       ${password_in}
    click the my account link
    click link change password
    ${ramdom_pass}   Generate Random String  6
    Complete Change password    ${EMPTY}      ${ramdom_pass}      ${ramdom_pass}
    click the change password button
    sleep    2
    Verify error old password blank

    Complete Change password    ${password_in}      ${EMPTY}      ${ramdom_pass}
    click the change password button
    sleep    2
    Verify error new password blank

    Complete Change password    ${password_in}      ${ramdom_pass}      ${EMPTY}
    click the change password button
    sleep    2
    Verify error confirm password blank

Verify that the user can't change the password with the field password INVALID.
    [Tags]    PASSWORD-005
    ${login}  Create account with VALID information email ramdom    M    Huyen      Diu     15      12      2000
    go to   https://demo.nopcommerce.com/login
    ${email_in}    get from list    ${login}   0
    ${password_in}      get from list    ${login}   1
    Login with a VALID account      ${email_in}       ${password_in}
    click the my account link
    click link change password
    ${ramdom_pass}   Generate Random String  4
    Complete Change password    ${password_in}      ${ramdom_pass}      ${ramdom_pass}
    click the change password button
    sleep    2
    Verify new password least 6 character

Verify that the user cannot change the password that is the same as the previous old password.
    [Tags]    PASSWORD-006
    ${login}  Create account with VALID information email ramdom    M    Huyen      Diu     15      12      2000
    go to   https://demo.nopcommerce.com/login
    ${email_in}    get from list    ${login}   0
    ${password_in}      get from list    ${login}   1
    Login with a VALID account      ${email_in}       ${password_in}
    click the my account link
    click link change password
    ${ramdom_pass}   Generate Random String  7
    Complete Change password    ${password_in}      ${ramdom_pass}      ${ramdom_pass}
    click the change password button
    sleep    2
    Complete Change password    ${ramdom_pass}      ${password_in}      ${password_in}
    click the change password button
    sleep    2
    Verify password same as one of the last passwords you used

Verify that the user's account in other sessions logs out when the user changes the password in one session.
    [Tags]    PASSWORD-007
    ${login}  Create account with VALID information email ramdom    M    Huyen      Diu     15      12      2000
    go to   https://demo.nopcommerce.com/login
    ${email_in}    get from list    ${login}   0
    ${password_in}      get from list    ${login}   1
    Login with a VALID account      ${email_in}       ${password_in}
    Open Browser     https://demo.nopcommerce.com/login   firefox   executable_path=${firefoxdriver}
    Login with a VALID account      ${email_in}       ${password_in}

    switch browser    1
    click the my account link
    click link change password
    ${ramdom_pass}   Generate Random String  7
    Complete Change password    ${password_in}      ${ramdom_pass}      ${ramdom_pass}
    click the change password button

    switch browser    2
    reload page
    click the my account link
    sleep    3
    Verify the log in link visible