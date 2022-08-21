*** Settings ***
Library    SeleniumLibrary
Resource    ../Resourses/common_resources.robot
Resource    ../Resourses/header_resources.robot
Resource    ../Resourses/home_resources.robot
Resource    ../Resourses/bar_notify_resources.robot
Resource    ../Resourses/cart_resource.robot
Test Setup       open my browser     ${url}   ${browser}
Test Teardown    close my browser
Force Tags    Home
*** Variables ***
${url}    https://demo.nopcommerce.com
${browser}      chrome

*** Test Cases ***

