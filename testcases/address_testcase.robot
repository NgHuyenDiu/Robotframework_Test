*** Settings ***
Library    SeleniumLibrary
Resource    ../Resourses/header_resources.robot
Resource    ../Resourses/address_resources.robot
Resource    ../Resourses/common_resources.robot
Resource    ../Resourses/register_resource.robot
Resource    ../Resourses/account_resources.robot
Test Setup       open my browser     ${url}   ${browser}
Test Teardown    close my browser
Force Tags    Address

*** Variables ***
${url}    https://demo.nopcommerce.com/register
${browser}      chrome
*** Test Cases ***
Verify that the user can successfully add new addresses.
    [Tags]    ADDRESS-001
    Create account with VALID information   M    John    Doe     12    10    2000    abc36@gmail.com    123456      123456
    click the my account link
    Click link address
    click button add new
    create address      John    Doe     346@gmail.com      United States       Alabama         Texas        San Antonio      71200       0123456789
    sleep      3
