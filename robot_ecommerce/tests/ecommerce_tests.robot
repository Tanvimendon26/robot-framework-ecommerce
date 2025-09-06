*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot
Suite Setup    Open Browser To Demo WebShop
Suite Teardown    Close Browser

*** Variables ***
${VALID_EMAIL}       testuser@example.com
${VALID_PASSWORD}    Test@123
${PRODUCT_NAME}      Computing and Internet
${SEARCH_PRODUCT}    Books

*** Test Cases ***
TC001 Login
    Login    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Page Should Contain    My account
    Logout

TC002 Invalid Login
    Login    invalid@example.com    wrongpass
    Page Should Contain    Login was unsuccessful

TC003 Browse Products
    Click Link    Books
    Page Should Contain    Books

TC004 Add Product To Cart
    Add Product To Cart    ${PRODUCT_NAME}
    Page Should Contain    The product has been added

TC005 Remove Product From Cart
    Add Product To Cart    ${PRODUCT_NAME}
    Remove Product From Cart    ${PRODUCT_NAME}
    Page Should Not Contain    ${PRODUCT_NAME}

TC006 Update Quantity In Cart
    Add Product To Cart    ${PRODUCT_NAME}
    Update Quantity In Cart    ${PRODUCT_NAME}    2
    # Optional: verify total price updated

TC007 Checkout Process
    Add Product To Cart    ${PRODUCT_NAME}
    Proceed To Checkout

TC008 Logout
    Login    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Logout

TC009 Search Product
    Search Product    ${SEARCH_PRODUCT}
    Page Should Contain    ${SEARCH_PRODUCT}

TC010 View Product Details
    Click Link    ${PRODUCT_NAME}
    Page Should Contain    ${PRODUCT_NAME}
