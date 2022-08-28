*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/address.py
*** Keywords ***
click button add new
    click button    ${btn_add_new}
Enter address first name
    [Arguments]    ${Address_FirstName_input}
    input text    ${Address_FirstName}      ${Address_FirstName_input}
Enter address lastname
    [Arguments]    ${Address_LastName_input}
    input text    ${Address_LastName}       ${Address_LastName_input}
Enter address email
    [Arguments]    ${email_input}
    input text    ${Address_Email}   ${email_input}

Enter Address_Company
    [Arguments]    ${Address_Company_input}
    input text    ${Address_Company}     ${Address_Company_input}

Select Address_CountryId
    [Arguments]    ${Address_CountryId_input}
    select from list by label    ${Address_CountryId}    ${Address_CountryId_input}

Select Address_StateProvinceId
    [Arguments]    ${Address_StateProvinceId_input}
    select from list by label    ${Address_StateProvinceId}        ${Address_StateProvinceId_input}

Enter Address_City
    [Arguments]    ${Address_City_input}
    input text    ${Address_City}       ${Address_City_input}

Enter Address_Address1
    [Arguments]    ${Address_Address1_input}
    input text    ${Address_Address1}       ${Address_Address1_input}

Enter Address_ZipPostalCode
    [Arguments]    ${Address_ZipPostalCode_input}
    input text    ${Address_ZipPostalCode}      ${Address_ZipPostalCode_input}

Enter Address_PhoneNumber
    [Arguments]    ${Address_PhoneNumber_input}
    input text    ${Address_PhoneNumber}        ${Address_PhoneNumber_input}

Click btn save
    click button    ${btn_save}
wait state load
    wait until element is not visible    ${lbl_wait}
create address
    [Arguments]    ${Address_FirstName_input}   ${Address_LastName_input}   ${email_input}   ${Address_CountryId_input}   ${Address_StateProvinceId_input}  ${Address_City_input}    ${Address_Address1_input}       ${Address_ZipPostalCode_input}      ${Address_PhoneNumber_input}
    Enter address first name    ${Address_FirstName_input}
    Enter address lastname    ${Address_LastName_input}
    Enter address email     ${email_input}
    Select Address_CountryId    ${Address_CountryId_input}
#    scroll element into view    ${Address_PhoneNumber}
    wait state load
    Select Address_StateProvinceId    ${Address_StateProvinceId_input}
    Enter Address_City      ${Address_City_input}
    Enter Address_Address1    ${Address_Address1_input}
    Enter Address_ZipPostalCode    ${Address_ZipPostalCode_input}
    Enter Address_PhoneNumber    ${Address_PhoneNumber_input}
    Click btn save

Display input error message
    ${list_mess}   get text    ${error_message}
    log to console    ${list_mess}

Display select error message
    ${list_mess}   get text    ${error_select}
    log to console    ${list_mess}

Verify error message display
    page should contain    ${error_message}
