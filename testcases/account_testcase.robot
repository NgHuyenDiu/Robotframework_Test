*** Settings ***
Library    SeleniumLibrary
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
*** Test Cases ***
Verify that the user's information is exactly the same as when the user registered.
    register_resource.Create account with VALID information     M    Huyen      Diu     15      12      2000        huyendiu4@gmail.com      123456      123456
    click the my account link
    Verify infomation account       Huyen      Diu        huyendiu4@gmail.com
    sleep    3
