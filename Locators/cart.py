title = "xpath://h1[text()= 'Shopping cart']"

android_element = "xpath://a[text() = 'HTC One M8 Android L 5.0 Lollipop']/parent::h2/following-sibling::div[@class = 'add-info']/div[@class = 'buttons']/button[text() = 'Add to cart']"
laptop_macbook = "xpath://a[text() = 'Apple MacBook Pro 13-inch']/parent::h2/following-sibling::div[@class = 'add-info']/div[@class = 'buttons']/button[text() = 'Add to cart']"
element_need_info = "xpath://a[text() = 'Build your own computer']/parent::h2/following-sibling::div[@class = 'add-info']/div[@class = 'buttons']/button[text() = 'Add to cart']"
sku = "xpath://span[text()= 'M8_HTC_5L']"


popup_cart = "id:flyout-cart"
name_product = "xpath://div[@id = 'flyout-cart']//div[@class = 'name']//a"


#shopping cart
qty_M8_HTC_5L = "xpath://table[@class = 'cart']//a[text() = 'HTC One M8 Android L 5.0 Lollipop']/parent::td/following-sibling::td[@class= 'quantity']/input"

qty = "xpath://input[contains(@name, 'itemquantity')]"
price = "xpath://a[ contains(text(), 'Android')]/../following-sibling::td[@class='unit-price']/span"
total_page = "xpath://a[ contains(text(), 'Android')]/../following-sibling::td[@class='subtotal']/span"

data_empty = "xpath://div[@class='no-data']"
mess_error = "xpath://div[@class='message-error']//li"

btn_update_cart = "id:updatecart"
btn_remove_M8_HTC_5L = "xpath://table[@class = 'cart']//a[text() = 'HTC One M8 Android L 5.0 Lollipop']/parent::td/following-sibling::td[@class= 'remove-from-cart']/button"
select_gift = "xpath://select[@name = 'checkout_attribute_1']"
message_Gift_wrapping = "xpath://div[@class = 'selected-checkout-attributes']"
mess_gift_successfully = "xpath://div[@class = 'selected-checkout-attributes' and  contains( text() , '  Gift wrapping: Yes [+$10.00]') ]"
btn_check_out = "id:checkout"
checkbox_termsofservice = "id:termsofservice"
continue_shopping ="xpath://button[text() = 'Continue shopping']"
estimate_shipping_popup = "id:open-estimate-shipping-popup"