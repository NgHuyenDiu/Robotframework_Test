*** Settings ***
Library    SeleniumLibrary
Resource    ../Resourses/footer_resources.robot
Resource    ../Resourses/common_resources.robot
Resource    ../Resourses/register_resource.robot
Test Setup       open my browser     ${url}   ${browser}
Test Teardown    close my browser
Force Tags    footer
*** Variables ***
${url}    https://demo.nopcommerce.com
${browser}      chrome

*** Test Cases ***

Click the "Sitemap" option on the footer page.
    [Tags]    FOOTER-001
    click sitemap link button
    Verify successfully navigate to sitemap page


Click the "Shipping & returns" option on the footer page.
    [Tags]    FOOTER-002
    click shipping_return link button
    Verify successfully navigate to shipping_return page


Click the "Privacy notice" option on the footer page.
    [Tags]    FOOTER-003
    click privacy_notice link button
    Verify successfully navigate to Privacy_notice page

Click the "Conditions of Use" option on the footer page.
    [Tags]    FOOTER-004
    click Conditions_of_Use link button
    Verify successfully navigate to Conditions_of_Use page

Click the "About us" option on the footer page.
    [Tags]    FOOTER-005
    click about_us link button
    Verify successfully navigate to about_us page

Click the "Contact us" option on the footer page.
    [Tags]    FOOTER-006
    click Contact_us link button
    Verify successfully navigate to Contact_us page

Click the "Search" option on the footer page.
    [Tags]    FOOTER-007
    click search link button
    Verify successfully navigate to search page

Click the "News" option on the footer page.
    [Tags]    FOOTER-008
    click News link button
    Verify successfully navigate to News page

Click the "Blog" option on the footer page.
    [Tags]    FOOTER-009
    click Blog link button
    Verify successfully navigate to Blog page

Click the "Recently viewed products" option on the footer page.
    [Tags]    FOOTER-010
    click recently_viewed_products link button
    Verify successfully navigate to Recently_viewed_products page

Click the "Compare products list" option on the footer page.
    [Tags]    FOOTER-011
    click Compare_products_list link button
    Verify successfully navigate to Compare_products_list page

Click the "New products" option on the footer page.
    [Tags]    FOOTER-012
    click New_products link button
    Verify successfully navigate to New_products page

Click the "New My account" option on the footer page.
    [Tags]    FOOTER-013
    click my_account link button
    Verify customer navigate to login page if user hasn't logged in yet
    Click register button
    register_resource.Create account with VALID information email ramdom     M    Huyen      Diu     15      12      2000
    click my_account link button
    Verify navigate to my account page if user has logged

Click the "Orders" option on the footer page.
    [Tags]    FOOTER-014
    click orders link button
    Verify history navigate to login page if user hasn't logged in yet
    Click register button
    register_resource.Create account with VALID information email ramdom     M    Huyen      Diu     15      12      2000
    click orders link button
    Verify successfully navigate to history page if user has logged

Click the "Addresses" option on the footer page.
    [Tags]    FOOTER-015
    click Addresses link button
    Verify Addresses navigate to login page if user hasn't logged in yet
    Click register button
    register_resource.Create account with VALID information email ramdom     M    Huyen      Diu     15      12      2000
    click Addresses link button
    Verify successfully navigate to Addresses page if user has logged

Click the "Shopping cart" option on the footer page.
    [Tags]    FOOTER-016
    click Shopping_cart link button
    Verify successfully navigate to shopping cart page

Click the "Wishlist" option on the footer page.
    [Tags]    FOOTER-017
    click Wishlist link button
    Verify successfully navigate to wishlist page

Click the "Apply for vendor" account on the footer page.
    [Tags]    FOOTER-018
    click Apply_for_vendor_account link button
    Verify Apply_for_vendor_account navigate to login page if user hasn't logged in yet
    Click register button
    register_resource.Create account with VALID information email ramdom     M    Huyen      Diu     15      12      2000
    click Apply_for_vendor_account link button
    Verify successfully navigate to Apply_for_vendor_account page if user has logged

Click the facebook icon on the footer page.
    [Tags]    FOOTER-019
    click facebook link button
    Verify successfully navigate facebook page

Click the twitter icon on the footer page.
    [Tags]    FOOTER-020
    click Twitter link button
    Verify successfully navigate Twitter page

Click the twitter icon on the footer page.
    [Tags]    FOOTER-021
    click RSS link button
    Verify successfully navigate RSS page

Click the youtube icon on the footer page.
    [Tags]    FOOTER-022
    click YouTube link button
    Verify successfully navigate YouTube page

