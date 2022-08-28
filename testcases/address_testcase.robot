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
${firefoxdriver}      D:/thuctap/testcase_demo/driver/geckodriver.exe
*** Test Cases ***
Verify that the user can successfully add new addresses.
    [Tags]    ADDRESS-001
    Create account with VALID information email ramdom   M    John    Doe     12    10    2000
    click the my account link
    Click link address
    click button add new
    create address      John    Doe     346@gmail.com      United States       Alabama         Texas        San Antonio      71200       0123456789
    sleep      3

Verify that an error message displays when the user leaves the required field BLANK.
    [Tags]    ADDRESS-002
    Create account with VALID information email ramdom   M    John    Doe     12    10    2000
    click the my account link
    Click link address
    click button add new
    create address    ${EMPTY}    Doe     346@gmail.com      United States       Alabama         Texas        San Antonio      71200       0123456789
    Display input error message
    create address    John    ${EMPTY}     346@gmail.com      United States       Alabama         Texas        San Antonio      71200       0123456789
    Display input error message
    create address    John    Doe     ${EMPTY}      United States       Alabama         Texas        San Antonio      71200       0123456789
    Display input error message
    create address    John    Doe     346@gmail.com      Select country       Select state         Texas        San Antonio      71200       0123456789
    Display select error message
    create address    John    Doe     346@gmail.com      United States       Select state        Texas        San Antonio      71200       0123456789
    Display select error message
    create address    John    Doe     346@gmail.com      United States       Alabama         ${EMPTY}        San Antonio      71200       0123456789
    Display input error message
    create address    John    Doe     346@gmail.com      United States       Alabama          Texas       ${EMPTY}      71200       0123456789
    Display input error message
    create address    John    Doe     346@gmail.com      United States       Alabama         Texas        San Antonio      ${EMPTY}       0123456789
    Display input error message
    create address    John    Doe     346@gmail.com      United States       Alabama         Texas        San Antonio      71200       ${EMPTY}
    Display input error message

Verify that the user cannot add a new address with the field email INVALID.
    [Tags]    ADDRESS-003
    Create account with VALID information email ramdom   M    John    Doe     12    10    2000
    click the my account link
    Click link address
    click button add new
    create address    John    Doe     346      United States       Alabama         Texas        San Antonio      71200       0123456789
    Display input error message

Verify that the user cannot add a new address with the field Zip / postal code INVALID.
    [Tags]    ADDRESS-004
    Create account with VALID information email ramdom   M    John    Doe     12    10    2000
    click the my account link
    Click link address
    click button add new
    create address    John    Doe     346@gmail.com      United States       Alabama         Texas        San Antonio      abc       0123456789
    Verify error message display

Verify that the user cannot add a new address with the field phone number INVALID.
    [Tags]    ADDRESS-005
    Create account with VALID information email ramdom   M    John    Doe     12    10    2000
    click the my account link
    Click link address
    click button add new
    create address    John    Doe     346@gmail.com      United States       Alabama         Texas        San Antonio      123456       abc
    Verify error message display

Verify that login is required before viewing address information.
    [Tags]    ADDRESS-006
    Create account with VALID information email ramdom   M    John    Doe     12    10    2000
    click the my account link
    Click link address
    click button add new
    create address      John    Doe     346@gmail.com      United States       Alabama         Texas        San Antonio      71200       0123456789
    sleep      3
    ${url}      get location
    Open Browser     ${url}   firefox   executable_path=${firefoxdriver}
    title should be    nopCommerce demo store. Login