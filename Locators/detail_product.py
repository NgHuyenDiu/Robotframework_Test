#macbook
min_qty_notification = "xpath://div[@class = 'min-qty-notification']"
btn_add_to_cart_min_qty = "xpath://div[@class = 'min-qty-notification']/parent::div//button"
wishlist_macbook = "xpath://h1[contains(text(), 'MacBook')]/ancestor::div[1]/following-sibling::div[@class = 'overview-buttons']//button[contains(text(), 'wishlist')]"

# build to your computer
hdd = "xpath://label[text() = '400 GB [+$100.00]']/preceding::input[@value ='7']"
btn_add_to_cart_need_info = "xpath://h1/parent::div/following-sibling::div[@class = 'add-to-cart']//button"
wishlist_build = "xpath://h1[contains(text(), 'Build')]/ancestor::div[1]/following-sibling::div[@class = 'overview-buttons']//button[contains(text(), 'wishlist')]"
