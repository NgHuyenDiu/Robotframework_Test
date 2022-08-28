*** Settings ***
Library    SeleniumLibrary
Resource    ../Resourses/register_resource.robot
Resource    ../Resourses/common_resources.robot
Test Setup       open my browser     ${url}   ${browser}
Test Teardown    close my browser
Force Tags    Register

*** Variables ***
${url}    https://demo.nopcommerce.com/register
${browser}      chrome

*** Test Cases ***
Verify that the user cannot create an account with all fields blank.
    [Tags]    REGISTER-001
    Create account with all fields blank

Verify that an error message displays when the user leaves the required field BLANK.
    [Tags]    REGISTER-003
    Create account with the first name field BLANK     ${EMPTY}     diu    asd@gmail.com       123456     123456
    Create account with the last name field BLANK    diu     ${EMPTY}      asd@gmail.com       123456     123456
    Create account with the email field BLANK     diu      oha     ${EMPTY}       123456     123456
    Create account with the password field BLANK     diu     oha     asd@gmail.com       ${EMPTY}     123456

Verify that successful register account.
    [Tags]    REGISTER-002
    Create account with VALID information email ramdom   M   Nguyen  Diu     12      10      2000

Verify that the user cannot create an account with the field email INVALID.
    [Tags]    REGISTER-004
    create account with the field email invalid.    nguyen     diu    asd      123456     123456

Verify that the user cannot create an account with the field password INVALID.
    [Tags]    REGISTER-005
    create account with the password invalid    nguyen     diu    asd      123     123

Verify that the user cannot create an account with confirmed password and password fields are not the same.
    [Tags]    REGISTER-006
    Create account with confirm password not same password      nguyen     diu    asd      123456     1236

Verify that the user cannot create an account with an INVALID Date of birth.
    [Tags]    REGISTER-007
    Create account with the birthday INVALID    nguyen     diu    31    2   2000     123456     123456

Verify that the user cannot create an account with the Company name INVALID.
    [Tags]    REGISTER-008
#    Create account with the computer name too long    nguyen     diu    rkTZ6dCngZOm26GsywyulMZa7gEwXnD23wGIQUHDUOoqJ76UxfiSfHrFzRdZrTwS93eoTOz2Zc8IkBgrleevMRJpa2mZ9k4nHjePcNZRTJP9uiFyXFxkzhV1dWETT6zTe1kkWNaEx6xDMrzPAq1rP7h4qrzQvHaEe50ML572ftYHZgVVxhjaQmCyTefatunNZERU3PTS     123456     123456
    #Create account with the company name INVALID    nguyen     diu   https://www.diffchecker.com/image-diff/    123456     123456
    #Create account with the company name INVALID    nguyen     diu   1234567    123456     123456
    Create account with the company name INVALID    nguyen     diu   @#$%^%^%^^    123456     123456

