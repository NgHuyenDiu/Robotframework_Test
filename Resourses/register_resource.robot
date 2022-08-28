*** Settings ***
Library    SeleniumLibrary
Library    ../mylib/lib.py
Library    String
Variables    ../Locators/register.py

*** Variables ***

*** Keywords ***

select gender
    [Arguments]    ${value_gender}
    SeleniumLibrary.select radio button    ${gender_name}   ${value_gender}
Enter first name
    [Arguments]    ${first_name_str}
    SeleniumLibrary.input text    ${first_name}     ${first_name_str}
Enter last name
    [Arguments]    ${last_name_str}
    SeleniumLibrary.input text    ${last_name}  ${last_name_str}
Select date of birth
    [Arguments]    ${day}   ${month}    ${year}
    SeleniumLibrary.select from list by value    ${list_day}     ${day}
    SeleniumLibrary.select from list by value    ${list_month}       ${month}
    SeleniumLibrary.select from list by value    ${list_year}        ${year}

Enter email
    [Arguments]    ${email_str}
    SeleniumLibrary.input text    ${email}   ${email_str}

Enter company name
    [Arguments]    ${company_str}
    SeleniumLibrary.input text    ${company}   ${company_str}

Enter password
    [Arguments]    ${password_str}
    SeleniumLibrary.input text    ${password}    ${password_str}

Enter confirm password
    [Arguments]   ${confirm_password_str}
    SeleniumLibrary.input text    ${confirm_password}    ${confirm_password_str}

Click the register button
    SeleniumLibrary.click button    ${register_button}



Verify first name error message
    ${firstname}     SeleniumLibrary.get text    ${first_name_error}
    log to console    ${firstname}
Verify last name error message
    ${lastname}     SeleniumLibrary.get text    ${last_name_error}
    log to console    ${lastname}

Verify email error message
    ${email}     SeleniumLibrary.get text    ${email_error}
    log to console  ${email}

Verify password error message
    ${password}     SeleniumLibrary.get text    ${password_error}
    log to console    ${password}

Verify error message
    ${firstname}     SeleniumLibrary.get text    ${first_name_error}
    log to console    ${firstname}
    ${lastname}     SeleniumLibrary.get text    ${last_name_error}
    log to console    ${lastname}
    ${email}     SeleniumLibrary.get text    ${email_error}
    log to console  ${email}
    ${password}     SeleniumLibrary.get text    ${password_error}
    log to console    ${password}

Verify confirm password error message
    ${confirm}     SeleniumLibrary.get text    ${confirm_password_error}
    log to console    ${confirm}

Verify birthday error message display
    SeleniumLibrary.page should contain     Date of birth invalid.

Verify computer name long error message display
    SeleniumLibrary.page should contain     Company name is too long.

Verify computer name invalid message
    SeleniumLibrary.page should contain    Invalid company name.



Create account with all fields blank
    Enter first name    ${EMPTY}
    Enter last name     ${EMPTY}
    Enter email     ${EMPTY}
    Enter password      ${EMPTY}
    Click the register button
    Verify error message

Create account with VALID information email ramdom
    [Arguments]   ${gender_input}    ${first_name_input}  ${last_name_input}  ${day_input}    ${month_input}  ${year_input}
    select gender   ${gender_input}
    Enter first name    ${first_name_input}
    Enter last name      ${last_name_input}
    Select date of birth    ${day_input}    ${month_input}      ${year_input}

    execute javascript    document.getElementById("Email").value = Math.round(Math.random()*100000)+"@gmail.com"
    ${email_out}    get value    ${email}
    ${pass_ramdom}  Generate Random String  6
    register_resource.Enter password      ${pass_ramdom}
    register_resource.Enter confirm password      ${pass_ramdom}
    Click the register button
    ${locate}       SeleniumLibrary.get location
    log to console    ${locate}
    SeleniumLibrary.element should be visible    xpath://div[text() = 'Your registration completed']
    ${color}    SeleniumLibrary.Execute Javascript   return window.getComputedStyle(document.evaluate("//div[text() = 'Your registration completed']", document , null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue,null).getPropertyValue('color');
    ${hex_color}   transform RGB to HEX    ${color}
    log to console     ${hex_color}
    ${login}    create list    ${email_out}     ${pass_ramdom}
    [Return]    ${login}

Create account with VALID information
    [Arguments]   ${gender_input}    ${first_name_input}  ${last_name_input}  ${day_input}    ${month_input}  ${year_input}  ${email_input}  ${password}   ${confirm_password_input}
    select gender   ${gender_input}
    Enter first name    ${first_name_input}
    Enter last name      ${last_name_input}
    Select date of birth    ${day_input}    ${month_input}      ${year_input}
    Enter email     ${email_input}
    Enter password      ${password}
    Enter confirm password      ${confirm_password_input}
    Click the register button
    ${locate}       SeleniumLibrary.get location
    log to console    ${locate}
    SeleniumLibrary.element should be visible    xpath://div[text() = 'Your registration completed']
    ${color}    SeleniumLibrary.Execute Javascript   return window.getComputedStyle(document.evaluate("//div[text() = 'Your registration completed']", document , null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue,null).getPropertyValue('color');
    ${hex_color}   transform RGB to HEX    ${color}
    log to console     ${hex_color}

Create account with the first name field BLANK
    [Arguments]    ${first_name}    ${last_name}    ${email}    ${password}     ${confirm_password}
    Enter first name    ${first_name}
    Enter last name     ${last_name}
    Enter email     ${email}
    Enter password      ${password}
    Enter confirm password  ${confirm_password}
    Click the register button
    Verify first name error message

Create account with the last name field BLANK
    [Arguments]    ${first_name}    ${last_name}    ${email}    ${password}     ${confirm_password}
    Enter first name    ${first_name}
    Enter last name     ${last_name}
    Enter email     ${email}
    Enter password      ${password}
    Enter confirm password  ${confirm_password}
    Click the register button
    Verify last name error message

Create account with the email field BLANK
    [Arguments]    ${first_name}    ${last_name}    ${email}    ${password}     ${confirm_password}
    Enter first name    ${first_name}
    Enter last name     ${last_name}
    Enter email     ${email}
    Enter password      ${password}
    Enter confirm password  ${confirm_password}
    Click the register button
    Verify email error message

Create account with the password field BLANK
    [Arguments]    ${first_name}    ${last_name}    ${email}    ${password}     ${confirm_password}
    Enter first name    ${first_name}
    Enter last name     ${last_name}
    Enter email     ${email}
    Enter password      ${password}
    Enter confirm password  ${confirm_password}
    Click the register button
    Verify password error message

Create account with the field email INVALID.
    [Arguments]    ${first_name}    ${last_name}    ${email}    ${password}     ${confirm_password}
    Enter first name    ${first_name}
    Enter last name     ${last_name}
    Enter email     ${email}
    Enter password      ${password}
    Enter confirm password  ${confirm_password}
    Click the register button
    Verify email error message

Create account with the password INVALID
    [Arguments]    ${first_name}    ${last_name}    ${email}    ${password}     ${confirm_password}
    Enter first name    ${first_name}
    Enter last name     ${last_name}
    Enter email     ${email}
    Enter password      ${password}
    Enter confirm password  ${confirm_password}
    Click the register button
    Verify password error message

Create account with confirm password not same password
    [Arguments]    ${first_name}    ${last_name}    ${email}    ${password}     ${confirm_password}
    Enter first name    ${first_name}
    Enter last name     ${last_name}
    Enter email     ${email}
    Enter password      ${password}
    Enter confirm password    ${confirm_password}
    Click the register button
    Verify confirm password error message

Create account with the birthday INVALID
    [Arguments]    ${first_name}    ${last_name}  ${day}   ${month}  ${year}    ${password}     ${confirm_password}
    Enter first name    ${first_name}
    Enter last name     ${last_name}
    Select date of birth    ${day}    ${month}    ${year}
    execute javascript    document.getElementById("Email").value = Math.round(Math.random()*100000)+"@gmail.com"
#    Enter email     ${email}
    Enter password      ${password}
    Enter confirm password    ${confirm_password}
    Click the register button
    Verify birthday error message display

Create account with the computer name too long
    [Arguments]    ${first_name}    ${last_name}   ${computer_name}    ${password}     ${confirm_password}
    Enter first name    ${first_name}
    Enter last name     ${last_name}
    Select date of birth    11      12      2000
    execute javascript    document.getElementById("Email").value = Math.round(Math.random()*100000)+"@email.com"
#    Enter email     ${email}
    Enter password      ${password}
    Enter confirm password    ${confirm_password}
    Click the register button
    Verify computer name long error message display

Create account with the company name INVALID
    [Arguments]    ${first_name}    ${last_name}   ${computer_name}    ${password}     ${confirm_password}
    Enter first name    ${first_name}
    Enter last name     ${last_name}
    Select date of birth    13    11    2001
    execute javascript    document.getElementById("Email").value = Math.round(Math.random()*100000)+"@gmail.com"
#    Enter email     ${email}
    Enter password      ${password}
    Enter confirm password    ${confirm_password}
    Click the register button
#    capture page screenshot    company-name-invalid.png
    Verify computer name invalid message
