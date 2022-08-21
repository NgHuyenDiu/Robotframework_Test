*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
open my browser
    [Arguments]    ${url}   ${browser}
    SeleniumLibrary.open browser    ${url}   ${browser}
    SeleniumLibrary.maximize browser window

Close my browser
    SeleniumLibrary.close all browsers