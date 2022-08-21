*** Settings ***
Library    SeleniumLibrary
Resource    ../Resourses/common_resources.robot
Resource    ../Resourses/header_resources.robot
Resource    ../Resourses/home_resources.robot
Resource    ../Resourses/bar_notify_resources.robot
Resource    ../Resourses/detail_product_resource.robot
Resource    ../Resourses/wishlist_resource.robot
Resource    ../Resourses/cart_resource.robot
Test Setup       open my browser     ${url}   ${browser}
Test Teardown    close my browser
Force Tags    wishlist
*** Variables ***
${url}    https://demo.nopcommerce.com
${browser}      chrome

*** Test Cases ***
Verify that add product to wishlist succeeds when user adds to wishlist a product has minimum quantity more than 1.
    [Tags]    WISHLIST-001
    Scroll to news element
    Add macbook to wishlist
    Click Add to wishlist in macbook detail page.
    Verify message success
    close bar notification
    scroll to top page
    Verify quantity of wishlist

Verify that add product to wishlist succeeds when user adds to wishlist product needs to provide more information.
    [Tags]    WISHLIST-002
    Scroll to news element
    Add build your own computer to wishlist
    Choose HDD
    Select RAM
    Click Add to wishlist in build own computer detail page.
    Verify message success
    close bar notification
    scroll to top page
    Verify quantity of wishlist

Verify that add product to wishlist succeeds when user adds to wishlist a product has minimum quantity equal to 1.
    [Tags]    WISHLIST-003
    Scroll to news element
    Add M8_HTC_5L to wishlist
    Verify message success
    close bar notification
    scroll to top page
    Verify quantity of wishlist

Verify that adding wishlist succeeds when user adds wishlist 1 product multiple times.
    [Tags]    WISHLIST-004
    Scroll to news element
    Add M8_HTC_5L to wishlist
    Verify message success
    close bar notification

    sleep    2
    Scroll to news element
    Add M8_HTC_5L to wishlist
    Verify message success
    close bar notification

    sleep    2
    Scroll to news element
    Add M8_HTC_5L to wishlist
    Verify message success
    close bar notification

    scroll to top page
    Verify quantity of wishlist
    sleep   2
    click wishlist cart link button

Verify that update wishlist succeeds when the user changes the "Qty." of any product in wishlist page more than 0.
    [Tags]    WISHLIST-005
    Scroll to news element
    Add M8_HTC_5L to wishlist
    Verify message success
    close bar notification

    scroll to top page
    sleep    1
    click wishlist cart link button
    wait page load
    Change quantity     7
    Click button update wishlist
    sleep    5
    wishlist_resource.Verify total change
Verify that wishlist auto remove product when the user changes the "Qty." of any product in wishlist page equal to 0.
    [Tags]    WISHLIST-006
    Scroll to news element
    Add M8_HTC_5L to wishlist
    Verify message success
    close bar notification

    scroll to top page
    sleep    1
    click wishlist cart link button
    wait page load
    Change quantity     0
    Click button update wishlist
    Verify wishlist page empty
    sleep    5

Changes the "Qty." less than 0 of product has minimum quantity equal to 1.
    [Tags]    WISHLIST-007
    Scroll to news element
    Add M8_HTC_5L to wishlist
    Verify message success
    close bar notification

    scroll to top page
    sleep    1
    click wishlist cart link button
    wait page load
    Change quantity     -2
    Click button update wishlist
    wishlist_resource.Verify message error
    wishlist_resource.Verify quantity default     1
    sleep    5
Changes the "Qty." less than 0 of product has minimum quantity equal to 2 .
    [Tags]    WISHLIST-007
    Scroll to news element
    Add macbook to wishlist
    Click Add to wishlist in macbook detail page.
    Verify message success
    close bar notification
    scroll to top page
    sleep    1
    click wishlist cart link button
    wait page load
    Change quantity     -2
    Click button update wishlist
    wishlist_resource.Verify message error
    wishlist_resource.Verify quantity default     2
    sleep    5

Verify that the user can successfully remove the product in the wishlist page.
    [Tags]    WISHLIST-008
    Scroll to news element
    Add M8_HTC_5L to wishlist
    Verify message success
    close bar notification

    scroll to top page
    sleep    1
    click wishlist cart link button
    wait page load
    Remove product in wishlist page
    Verify wishlist page empty
    sleep    5

Verify that user can successfully add to the cart the product in wishlist page.
        [Tags]    WISHLIST-009
    Scroll to news element
    Add M8_HTC_5L to wishlist
    Verify message success
    close bar notification

    scroll to top page
    sleep    1
    click wishlist cart link button
    wait page load
    Click check box add to cart
    Click add to cart button
    sleep    3
    get title cart
    verify M8_HTC_5L visibility
    go back
    sleep    3
    get title wishlist
Verify that user can successfully sharing wishlist cart with the link wishlist URL for sharing.
    [Tags]    WISHLIST-011
    Scroll to news element
    Add M8_HTC_5L to wishlist
    Verify message success
    close bar notification

    scroll to top page
    sleep    1
    click wishlist cart link button
    wait page load
    Click link sharing
    get title wishlist of
    sleep    3