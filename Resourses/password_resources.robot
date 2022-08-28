*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/password.py
*** Keywords ***
Enter old password
    [Arguments]    ${old_password_input}
    input text    ${old_password}   ${old_password_input}

Enter new password
    [Arguments]    ${new_password_input}
    input text    ${new_password}       ${new_password_input}

Enter confirm password
    [Arguments]    ${confirm_new_password_input}
    input text    ${confirm_new_password}       ${confirm_new_password_input}

Click the change password button
    click element    ${btn_change_password}

click link change password
    click element    ${link_change_password}

Complete Change password
    [Arguments]    ${old_password_input}    ${new_password_input}       ${confirm_password_input}
    Enter old password    ${old_password_input}
    Enter new password    ${new_password_input}
    password_resources.Enter confirm password    ${confirm_password_input}

Verify change password success
    page should contain element    ${bar_success}

Verify old password error message
    page should contain element    ${div_error_mess}

Verify password do not match confirm password
    page should contain element    ${Confirm_not_match}

Verify confirm password blank
    page should contain element    ${confirm_require}

Verify error old password blank
    page should contain element    ${old_password_error}

Verify error new password blank
    page should contain element    ${new_password_error}

Verify error confirm password blank
    page should contain element    ${confirm_password_error}

Verify new password least 6 character
    page should contain element    ${least_6_char}

Verify password same as one of the last passwords you used
    page should contain element    ${error_match_old_password}