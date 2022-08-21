*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/bar_notify.py
*** Keywords ***
Verify message success
    wait until page contains element    ${bar_notify_succsess}
    ${mes}    get text    ${message_add_success}
    log to console    ${mes}

close bar notification
    click element    ${close_bar_notification}