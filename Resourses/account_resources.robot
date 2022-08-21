*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/account.py
*** Keywords ***
Verify infomation account
    [Arguments]    ${first_name_input}  ${last_name_input}  ${email_input}
    ${first_name_output}    get value    ${first_name}
    ${last_name_output}     get value    ${last_name}
    ${email_output}     get value    ${email}
    log to console    ${first_name_output}      ${last_name_output}     ${email_output}
    should be equal    ${first_name_input}      ${first_name_output}
    should be equal    ${last_name_input}       ${last_name_output}
    should be equal    ${email_input}       ${email_output}

Click link address
    click element    ${link_address}
