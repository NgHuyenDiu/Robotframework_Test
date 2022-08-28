*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/header.py
*** Keywords ***
Click the logo link
    click element    ${logo_link}

Click shopping cart link button
    click element    ${shopping_cart_linkbutton}

Click go to shopping cart
    mouse over    ${shopping_cart_linkbutton}
    click button    ${go_to_cart}

Get info first item in popup shoping cart
    mouse over    ${shopping_cart_linkbutton}
    ${name}     get text    ${name_item_first}
    ${price}    get text    ${price_item_first}
    ${quantity}    get text    ${quantity_item_first}
    ${total}    get text    ${total}
    log to console    ${name}
    log to console    ${price}
    log to console    ${quantity}
    log to console    ${total}

Click the logout link
    click element    ${logout_linkbutton}

Click the log in link
    click element    ${login_linkbutton}

Verify the log in link visible
    page should contain element    ${login_linkbutton}

Click register link
    click element   ${register_linkbutton}

wait my account visibility
    wait until page contains element    ${myacccount_headerlink}

click the my account link
    click element    ${myacccount_headerlink}

Verify my acount link button display
    element should be visible   ${myacccount_headerlink}

Verify log out link button display
    element should be visible    ${logout_linkbutton}

click wishlist cart link button
    click element    ${wishlist_linkbutton}

Select curency customer
    [Arguments]    ${label}
    select from list by label      ${customer_currency}   ${label}

Enter search store
    [Arguments]    ${text}
    input text    ${searchterms}        ${text}

Click search button
    click button    ${btn_search}

Verify arlet message
    seleniumlibrary.alert should be present    Please enter some search keyword

scroll to top page
    execute javascript    window.scrollTo(0,0);

Verify quantity of wishlist
    ${qty}  get text    ${wishlist_qty}
    log to console    ${qty}


print all element in customer curency
    click element    ${customer_currency}
    sleep    1
    ${list_cur}     get list items    ${customer_currency}
    FOR    ${cur}    IN    ${list_cur}
        log to console     ${cur}
    END

click computer_link_dropdown
    click element    ${computer_link_dropdown}

click desktop_link
    mouse over    ${computer_link_dropdown}
    click element    ${desktop_link}

click notebook_link
    mouse over    ${computer_link_dropdown}
    click element    ${notebook_link}

click software_link
    mouse over    ${computer_link_dropdown}
    click element    ${soft_ware_link}

click electronics_link_dropdown 
    click element    ${electronics_link_dropdown }

click camera_and_photo_link
    mouse over    ${electronics_link_dropdown }
    click element    ${camera_and_photo_link}

click cell_phone_link
    mouse over    ${electronics_link_dropdown }
    click element    ${cell_phone_link}

click others_link
    mouse over    ${electronics_link_dropdown }
    click element    ${others_link }

click apparel_link_dropdown
    click element    ${apparel_link_dropdown}

click shoes_link
    mouse over   ${apparel_link_dropdown}
    click element    ${shoes_link}

click clothing_link
    mouse over   ${apparel_link_dropdown}
    click element    ${clothing_link}

click accessories_link
    mouse over   ${apparel_link_dropdown}
    click element    ${accessories_link}
    
click Digital_downloads_link
    click element    ${Digital_downloads_link}

click books_link
    click element    ${books_link}

click Jewelry_link
    click element    ${Jewelry_link}

click Gift_Cards_link
    click element    ${Gift_Cards_link}
