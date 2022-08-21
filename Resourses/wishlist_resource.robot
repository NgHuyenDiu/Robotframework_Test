*** Settings ***
Library    SeleniumLibrary
Library    String
Variables    ../Locators/wishlist.py
*** Keywords ***
get title wishlist
    ${title}    get title
    log to console    ${title}

wait page load
    wait until page contains element    ${qty}

Change quantity
    [Arguments]    ${quantity}
    input text    ${qty}     ${quantity}

Click button update wishlist
    click button    ${btn_update}

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

Verify wishlist page empty
    element should be visible    ${data_empty}

Verify message error
    element should be visible    ${mess_error}

Verify quantity default
    [Arguments]    ${default}
    ${qty}  get value    ${qty}
    should be equal    ${default}    ${qty}

Remove product in wishlist page
    click button    ${btn_remove_M8_HTC_5L}

Click check box add to cart
    click button    ${checkbox_add_to_cart}

Click add to cart button
    click button    ${btn_add_to_cart}

Click link sharing
    click element    ${link_share}

get title wishlist of
    ${title}    get title
    log to console    ${title}
    should be equal    ${title}     nopCommerce demo store. Wishlist