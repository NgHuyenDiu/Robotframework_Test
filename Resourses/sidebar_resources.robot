*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/sidebar.py
*** Keywords ***
click computer_link_dropdown
    click element    ${computer_link}

click desktop_link
    click element    ${desktops_link}

click notebook_link
    click element    ${notebook_link}

click software_link
    click element    ${soft_ware_link}

click electronics_link_dropdown
    click element    ${electronics_link }

click camera_and_photo_link
    click element    ${camera_and_photo_link}

click cell_phone_link
    click element    ${cell_phones}

click others_link
    click element    ${others}

click apparel_link_dropdown
    click element    ${apparel}

click shoes_link
    click element    ${shoes_link}

click clothing_link
    click element    ${clothing_link}

click accessories_link
    click element    ${accessories_link}

click Digital_downloads_link
    click element    ${Digital_downloads}

click books_link
    click element    ${books}

click Jewelry_link
    click element    ${Jewelry}

click Gift_Cards_link
    click element    ${Gift_Cards}

select checkbox CPU Type intel core i5
    select checkbox     ${cpu_intel_core_i5}

select checkbox CPU Type intel core i7
    select checkbox     ${cpu_intel_core_i7}
