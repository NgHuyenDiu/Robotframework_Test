*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/header.py
Variables    ../Locators/homepage.py

*** Keywords ***
Verify currency product changed
    scroll element into view    ${news}

Scroll to news element
    scroll element into view    ${news}

Add M8_HTC_5L to wishlist
    click button    ${wishlist_M8_HTC_5L}

Add macbook to wishlist
    click element    ${wishlist_mabook_home}

Add build your own computer to wishlist
    click element    ${wishlist_build_home}

Add M8_HTC_5L to compare list
    click button    ${compare_M8_HTC_5L}

Click product_comparison
    click element    ${product_comparison_link}

click documentation
    click element    ${documentation}

click forums
    click element    ${forums}

click nopCommerce
    click element    ${nopCommerce}

click electronics_cat
    click element    ${electronics_cat}

click apparel_cat
    click element    ${apparel_cat}

click digital_download_cat
    click element    ${digital_download_cat}

click title_M8_HTC_5L
    click element    ${title_M8_HTC_5L}

click detail_new_release
    click element    ${detail_new_release}

click view_news_archive
    click element    ${view_news_archive}

choose Community poll
    select radio button    pollanswers-1    2
click button vote
    click element    ${btn_vote}


