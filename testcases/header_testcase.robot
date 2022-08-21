*** Settings ***
Library    SeleniumLibrary
Resource    ../Resourses/common_resources.robot
Resource    ../Resourses/header_resources.robot
Resource    ../Resourses/home_resources.robot
Resource    ../Resourses/bar_notify_resources.robot
Resource    ../Resourses/cart_resource.robot
Test Setup       open my browser     ${url}   ${browser}
Test Teardown    close my browser
Force Tags    Header
*** Variables ***
${url}    https://demo.nopcommerce.com
${browser}      chrome

*** Test Cases ***
Verify the options in the currency dropdown list.
    [Tags]    HEADER-001
    print all element in customer curency

Verify the type of the currency chosen in currency dropdown.
    [Tags]    HEADER-002
    Select curency customer    Euro
    sleep    2
    Verify currency product changed
    sleep    5

Verify search store with blank input.
    [Tags]    HEADER-003
    Click search button
    verify arlet message
    sleep    5

Verify the results of the search store.
    [Tags]    HEADER-004
    Enter search store    HTC
    Click search button
    sleep   5
    Enter search store      oop
    Click search button
    sleep    5

Verify that product can add to wishlist successfully.
    Scroll to news element
    Add M8_HTC_5L to wishlist
    Verify message success
    close bar notification
    scroll to top page
    Verify quantity of wishlist

Verify that product can add to product comparison list successfully.
    [Tags]    HEADER-005
    Scroll to news element
    add m8_htc_5l to compare list
    verify message success
    Click product_comparison
    sleep    5

Verify the shopping cart when hovering on the Shopping cart button.
    [Tags]    HEADER-006
    Move to element
    Add to cart element HTC One M8 Android L 5.0 Lollipop
    Verify message success
    close bar notification
    sleep    1
    Get info first item in popup shoping cart

Verify navigation on the click shopping cart.
    [Tags]    HEADER-007
    Click shopping cart link button
    ${url_cart}    get location
    log to console    ${url_cart}
    IF    '${url_cart}'== 'https://demo.nopcommerce.com/cart'
        log to console    pass
    END

Verify navigation on click goes to the shopping cart.
    [Tags]    HEADER-008
    Move to element
    Add to cart element HTC One M8 Android L 5.0 Lollipop
    Verify message success
    close bar notification
    sleep    2
    Click go to shopping cart



