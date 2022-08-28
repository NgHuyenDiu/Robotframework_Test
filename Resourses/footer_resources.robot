*** Settings ***
Library    SeleniumLibrary
#Library    Selenium2Library
Variables    ../Locators/footer.py
Variables    ../Locators/login.py
*** Keywords ***
Click register button
    SeleniumLibrary.click button    ${btn_register}

click sitemap link button
    SeleniumLibrary.click element    ${sitemap}

Verify successfully navigate to sitemap page
    ${url_input}    SeleniumLibrary.get location
    should be equal    https://demo.nopcommerce.com/sitemap     ${url_input}

click shipping_return link button
    SeleniumLibrary.click element    ${shipping_return}

Verify successfully navigate to shipping_return page
    ${url_input}    SeleniumLibrary.get location
    should be equal    https://demo.nopcommerce.com/shipping-returns        ${url_input}

click Privacy_notice link button
    SeleniumLibrary.click element    ${Privacy_notice}

Verify successfully navigate to Privacy_notice page
    ${url_input}    SeleniumLibrary.get location
    should be equal    https://demo.nopcommerce.com/privacy-notice      ${url_input}

click Conditions_of_Use link button
    SeleniumLibrary.click element    ${Conditions_of_Use}

Verify successfully navigate to Conditions_of_Use page
    ${url_input}    SeleniumLibrary.get location
    should be equal    https://demo.nopcommerce.com/conditions-of-use       ${url_input}

click about_us link button
    SeleniumLibrary.click element    ${about_us}

Verify successfully navigate to about_us page
    ${url_input}    SeleniumLibrary.get location
    should be equal    https://demo.nopcommerce.com/about-us        ${url_input}

click Contact_us link button
    SeleniumLibrary.click element    ${Contact_us}

Verify successfully navigate to Contact_us page
    ${url_input}    SeleniumLibrary.get location
    should be equal    https://demo.nopcommerce.com/contactus       ${url_input}

click search link button
    SeleniumLibrary.click element    ${search}

Verify successfully navigate to search page
    ${url_input}   SeleniumLibrary.get location
    should be equal    https://demo.nopcommerce.com/search      ${url_input}

click News link button
    SeleniumLibrary.click element    ${News}

Verify successfully navigate to News page
    ${url_input}    SeleniumLibrary.get location
    should be equal    https://demo.nopcommerce.com/news        ${url_input}


click Blog link button
    SeleniumLibrary.click element    ${Blog}

Verify successfully navigate to Blog page
    ${url_input}    SeleniumLibrary.get location
    should be equal    https://demo.nopcommerce.com/blog        ${url_input}

click Recently_viewed_products link button
    SeleniumLibrary.click element    ${Recently_viewed_products}

Verify successfully navigate to Recently_viewed_products page
    ${url_input}    SeleniumLibrary.get location
    should be equal    https://demo.nopcommerce.com/recentlyviewedproducts      ${url_input}

click Compare_products_list link button
    SeleniumLibrary.click element    ${Compare_products_list}

Verify successfully navigate to Compare_products_list page
    ${url_input}    SeleniumLibrary.get location
    should be equal    https://demo.nopcommerce.com/compareproducts     ${url_input}

click New_products link button
    SeleniumLibrary.click element    ${New_products}

Verify successfully navigate to New_products page
    ${url_input}    SeleniumLibrary.get location
    should be equal    https://demo.nopcommerce.com/newproducts     ${url_input}

click my_account link button
    SeleniumLibrary.click element    ${my_account}

Verify customer navigate to login page if user hasn't logged in yet
    ${url_input}    SeleniumLibrary.get location
    should be equal    https://demo.nopcommerce.com/login?ReturnUrl=%2Fcustomer%2Finfo      ${url_input}

Verify navigate to my account page if user has logged
    ${url_input}    SeleniumLibrary.get location
    should be equal    https://demo.nopcommerce.com/customer/info       ${url_input}


click orders link button
    SeleniumLibrary.click element    ${orders}

Verify history navigate to login page if user hasn't logged in yet
    ${url_input}    SeleniumLibrary.get location
    should be equal    https://demo.nopcommerce.com/login?ReturnUrl=%2Forder%2Fhistory      ${url_input}

Verify successfully navigate to history page if user has logged
    ${url_input}    SeleniumLibrary.get location
    should be equal    https://demo.nopcommerce.com/order/history       ${url_input}

click Addresses link button
    SeleniumLibrary.click element    ${Addresses}

Verify Addresses navigate to login page if user hasn't logged in yet
    ${url_input}    SeleniumLibrary.get location
    should be equal    https://demo.nopcommerce.com/login?ReturnUrl=%2Fcustomer%2Faddresses     ${url_input}

Verify successfully navigate to Addresses page if user has logged
    ${url_input}    SeleniumLibrary.get location
    should be equal    https://demo.nopcommerce.com/customer/addresses      ${url_input}

click Shopping_cart link button
    SeleniumLibrary.click element    ${Shopping_cart}

Verify successfully navigate to shopping cart page
    ${url_input}    SeleniumLibrary.get location
    should be equal   https://demo.nopcommerce.com/cart     ${url_input}

click Wishlist link button
    SeleniumLibrary.click element    ${Wishlist}

Verify successfully navigate to wishlist page
    ${url_input}    SeleniumLibrary.get location
    should be equal   https://demo.nopcommerce.com/wishlist     ${url_input}

click Apply_for_vendor_account link button
    SeleniumLibrary.click element    ${Apply_for_vendor_account}

Verify Apply_for_vendor_account navigate to login page if user hasn't logged in yet
    ${url_input}    SeleniumLibrary.get location
    should be equal    https://demo.nopcommerce.com/login?ReturnUrl=%2Fvendor%2Fapply       ${url_input}

Verify successfully navigate to Apply_for_vendor_account page if user has logged
    ${url_input}    SeleniumLibrary.get location
    should be equal    https://demo.nopcommerce.com/vendor/apply        ${url_input}

click facebook link button
    SeleniumLibrary.click element   ${facebook}

Verify successfully navigate facebook page
   ${handles}=   SeleniumLibrary.Get Window Handles
   SeleniumLibrary.Switch Window   ${handles}[1]
   ${url_input}    SeleniumLibrary.get location
   should be equal   https://www.facebook.com/nopCommerce      ${url_input}

click Twitter link button
    SeleniumLibrary.click element       ${Twitter}

Verify successfully navigate Twitter page
    ${handles}=   SeleniumLibrary.Get Window Handles
    SeleniumLibrary.Switch Window   ${handles}[1]
    ${url_input}    SeleniumLibrary.get location
    should be equal   https://twitter.com/nopCommerce       ${url_input}

click RSS link button
    SeleniumLibrary.click element    ${RSS}

Verify successfully navigate RSS page
    ${url_input}    SeleniumLibrary.get location
    should be equal   https://demo.nopcommerce.com/news/rss/1       ${url_input}

click YouTube link button
    SeleniumLibrary.click element    ${YouTube}

Verify successfully navigate YouTube page
    ${handles}=   SeleniumLibrary.Get Window Handles
    SeleniumLibrary.Switch Window   ${handles}[1]
    ${url_input}    SeleniumLibrary.get location
    should be equal   https://www.youtube.com/user/nopCommerce      ${url_input}

enter newsletter_email
    [Arguments]    ${email}
    input text    ${newsletter_email}       ${email}

click subscribe button
    click button    ${subscribe}

