*** Settings ***
Library    SeleniumLibrary
Library    String
Variables    ../Locators/cart.py
Variables    ../Locators/header.py
Variables    ../Locators/login.py
Variables    ../Locators/homepage.py
Variables    ../Locators/detail_product.py

*** Keywords ***
get title cart
    ${title}    get title
    log to console    ${title}

Move to element
    scroll element into view        ${news}

Add to cart element HTC One M8 Android L 5.0 Lollipop
    click element    ${android_element}

Add to cart element Apple MacBook Pro 13-inch
    click element    ${laptop_macbook}

Add to cart element Build your own computer
    click element    ${element_need_info}

verify M8_HTC_5L visibility
    element should be visible    ${sku}

Hover to cart
    move to element     ${shopping_cart_linkbutton}

Verify quantity of cart
    ${qty}  get text    ${quantity_cart}
    log to console    ${qty}

Get name product
    ${name_product}   get text    ${name_product}
    log to console    ${name_product}

Verify pop up
    mouse over     ${shopping_cart_linkbutton}
    sleep    5

Get min quanlity notify
    WAIT UNTIL PAGE CONTAINS ELEMENT    ${min_qty_notification}
    ${mess}    get text    ${min_qty_notification}
    log to console    ${mess}

Add to cart min qty
    click button    ${btn_add_to_cart_min_qty}

Add to cart need info
    scroll element into view    ${btn_add_to_cart_need_info}
    click button    ${btn_add_to_cart_need_info}


#shopping cart

Change quantity of product
    [Arguments]    ${quantity}
    input text    ${qty_M8_HTC_5L}     ${quantity}

Click update shopping cart
    click element    ${btn_update_cart}

Verify total change
    ${price_value}    get text       ${price}
    ${value_price}      String.get substring    ${price_value}      1
    ${float_price}        convert to number      ${value_price}

    ${quantity}     get value    ${qty}

    ${total_value}       get text    ${total_page}
    ${value_total}      String.get substring    ${total_value}      1
    ${total}      replace string    ${value_total}    ,   ${EMPTY}    count=1
    ${float_total}        convert to number     ${total}

    ${price_temp}=  Evaluate    ${float_total} / ${quantity}
    ${float_price_divide}      convert to number     ${price_temp}

    should be equal    ${float_price}    ${float_price_divide}

Verify shopping cart page empty
    element should be visible    ${data_empty}

Verify message error
    element should be visible    ${mess_error}

Verify quantity default
    [Arguments]    ${default}
    ${qty}  get value    ${qty}
    should be equal    ${default}    ${qty}

Click remove button
    wait until page contains element    ${btn_remove_M8_HTC_5L}
    click button    ${btn_remove_M8_HTC_5L}

Select gift option
    scroll element into view    ${select_gift}
    select from list by value    ${select_gift}     2

get message gift success
    wait until page contains element    ${mess_gift_successfully}
    ${mess}     get text    ${message_Gift_wrapping}
    log to console    ${mess}

checked checkbox_termsofservice
    select checkbox    ${checkbox_termsofservice}

Click check out button
    scroll element into view    ${btn_check_out}
    click button    ${btn_check_out}

Login with a VALID account
    [Arguments]    ${email}     ${pass}
    go to    https://demo.nopcommerce.com/login
    input text    id:Email    ${email}
    input text    id:Password     ${pass}
    click button    ${locate_login_button}

Click button Continue shopping
    click button    ${continue_shopping}

Click estimate_shipping_popup
    click element    ${estimate_shipping_popup}

