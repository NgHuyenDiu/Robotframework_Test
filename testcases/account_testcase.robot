*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../Resourses/common_resources.robot
Resource    ../Resourses/account_resources.robot
Resource    ../Resourses/header_resources.robot
Resource    ../Resourses/register_resource.robot
Test Setup       open my browser     ${url}   ${browser}
Test Teardown    close my browser
Force Tags    Account

*** Variables ***
${url}    https://demo.nopcommerce.com/register
${browser}      chrome
${firefoxdriver}      D:/thuctap/testcase_demo/driver/geckodriver.exe
*** Test Cases ***
Verify that the user's information is exactly the same as when the user registered.
    [Tags]    ACCOUNT-001
    ${login}    register_resource.Create account with VALID information email ramdom     M    Huyen      Diu     15      12      2000
    click the my account link
    ${email}    get from list    ${login}  0
    Verify infomation account       Huyen      Diu       ${email}
    sleep    3

Verify that login is required before viewing account information.
    [Tags]    ACCOUNT-002
    ${login}    register_resource.Create account with VALID information email ramdom     M    Huyen      Diu     15      12      2000
    click the my account link
    ${email}    get from list    ${login}  0
    Verify infomation account       Huyen      Diu       ${email}
    sleep    3
    ${url}      get location
    Open Browser     ${url}   firefox   executable_path=${firefoxdriver}
    title should be    nopCommerce demo store. Login
