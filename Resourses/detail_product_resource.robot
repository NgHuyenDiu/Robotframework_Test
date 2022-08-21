*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/detail_product.py

*** Keywords ***
Click Add to wishlist in macbook detail page.
    wait until page contains element     ${wishlist_macbook}
    mouse over    ${wishlist_macbook}
    click element    ${wishlist_macbook}
Click Add to wishlist in build own computer detail page.
    wait until page contains element    ${wishlist_build}
    mouse over    ${wishlist_build}
    click element    ${wishlist_build}

Choose HDD
    sleep    5
    click element    ${hdd}

Select RAM
    select from list by value    product_attribute_2    5