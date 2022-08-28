*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../Resourses/cart_resource.robot
Resource    ../Resourses/common_resources.robot
Resource    ../Resourses/header_resources.robot
Resource    ../Resourses/bar_notify_resources.robot
Resource    ../Resourses/detail_product_resource.robot
Resource    ../Resourses/register_resource.robot
Test Setup       open my browser     ${url}   ${browser}
Test Teardown    close my browser

*** Variables ***
${url}    https://demo.nopcommerce.com
${browser}      chrome


*** Test Cases ***
Verify that add to cart succeeds when user adds products has a minimum quantity equal to 1.
    [Tags]    CART-001
    Move to element
    Add to cart element HTC One M8 Android L 5.0 Lollipop
    Verify message success
    close bar notification
    scroll to top page
    Verify quantity of cart
    Verify pop up
    Get name product

Verify that add to cart succeeds when user adds to cart product has a minimum quantity of more than 1.
    [Tags]    CART-002
    Move to element
    Add to cart element Apple MacBook Pro 13-inch
    Get min quanlity notify
    Add to cart min qty
    Verify message success
    close bar notification
    scroll to top page
    Verify quantity of cart
    Verify pop up
    Get name product

Verify that add to cart succeeds when user adds to cart product need to provide more information.
    [Tags]    CART-003
    Move to element
    Add to cart element Build your own computer
    Choose HDD
    Select RAM
    Add to cart need info
    Verify message success
    close bar notification
    scroll to top page
    Verify quantity of cart
    Verify pop up
    Get name product

Verify that update shopping cart succeeds when the user changes the number of products more than 0.
    [Tags]    CART-004
    Move to element
    Add to cart element HTC One M8 Android L 5.0 Lollipop
    Verify message success
    close bar notification
    scroll to top page
    Verify quantity of cart
    Verify pop up
    Get name product
    click shopping cart link button
    change quantity of product      7
    Click update shopping cart
    Verify total change
    sleep    10

Verify that shopping cart auto remove product when the user changes the quantity of product equal to 0.
    [Tags]    CART-005
    Move to element
    Add to cart element HTC One M8 Android L 5.0 Lollipop
    Verify message success
    close bar notification
    scroll to top page
    Verify quantity of cart
    Verify pop up
    Get name product
    click shopping cart link button
    change quantity of product      0
    Click update shopping cart
    Verify shopping cart page empty
    sleep    5

Verify that update shopping cart failed when the user changes the number of products less than 0.
    [Tags]    CART-006
    Move to element
    Add to cart element HTC One M8 Android L 5.0 Lollipop
    Verify message success
    close bar notification
    scroll to top page
    Verify quantity of cart
    Verify pop up
    Get name product
    click shopping cart link button
    change quantity of product      -3
    Click update shopping cart
    Verify message error
    Verify quantity default     1
    sleep    5

Verify the Shopping cart when the user removes the product.
    [Tags]    CART-007
    Move to element
    Add to cart element HTC One M8 Android L 5.0 Lollipop
    Verify message success
    close bar notification
    scroll to top page
    Verify quantity of cart
    Verify pop up
    Get name product
    click shopping cart link button
    Click remove button
    Verify shopping cart page empty
    sleep    5

Verify the Shopping cart when the user selects the option Gift wrapping
    [Tags]    CART-008
    Move to element
    Add to cart element HTC One M8 Android L 5.0 Lollipop
    Verify message success
    close bar notification
    scroll to top page
    Verify quantity of cart
    Verify pop up
    Get name product
    click shopping cart link button
    Select gift option
    get message gift success
    sleep    5

Verify check out the shopping cart in case the user is not logged in to the site.
    [Tags]    CART-009
    Move to element
    Add to cart element HTC One M8 Android L 5.0 Lollipop
    Verify message success
    close bar notification
    scroll to top page
    Verify quantity of cart
    Verify pop up
    Get name product
    click shopping cart link button
    checked checkbox_termsofservice
    Click check out button
    sleep    5

Verify check out the shopping cart in case the user is logged in to the site.
    [Tags]    CART-010
    Click register link
    ${login}  Create account with VALID information email ramdom    M    Huyen      Diu     15      12      2000

    go to   https://demo.nopcommerce.com/login
    ${email_in}    get from list    ${login}   0
    ${password_in}      get from list    ${login}   1
    Login with a VALID account      ${email_in}       ${password_in}

    Move to element
    Add to cart element HTC One M8 Android L 5.0 Lollipop
    Verify message success
    close bar notification
    scroll to top page
    Verify quantity of cart
    Verify pop up
    Get name product
    click shopping cart link button
    checked checkbox_termsofservice
    Click check out button
    sleep    5

Clicking on the "Continue shopping" button.
    [Tags]    CHECKLIST-CART-011
    Move to element
    Add to cart element HTC One M8 Android L 5.0 Lollipop
    Verify message success
    close bar notification
    scroll to top page
    Verify quantity of cart
    Verify pop up
    Get name product
    click shopping cart link button
    Click button Continue shopping
    sleep    5

Clicking on the"Estimate shipping"
    [Tags]    CHECKLIST-CART-012
    Move to element
    Add to cart element HTC One M8 Android L 5.0 Lollipop
    Verify message success
    close bar notification
    scroll to top page
    Verify quantity of cart
    Verify pop up
    Get name product
    click shopping cart link button
    Click estimate_shipping_popup
    sleep    5

Verify that cart update succeeds when user adds 1 product more than once.
    [Tags]    CART-013

    Move to element
    Add to cart element HTC One M8 Android L 5.0 Lollipop
    Verify message success
    close bar notification

    sleep    2
    Move to element
    Add to cart element HTC One M8 Android L 5.0 Lollipop
    Verify message success
    close bar notification

    sleep    2
    Move to element
    Add to cart element HTC One M8 Android L 5.0 Lollipop
    Verify message success
    close bar notification

    scroll to top page
    Verify quantity of cart
    sleep    2
    click shopping cart link button
    sleep    5

