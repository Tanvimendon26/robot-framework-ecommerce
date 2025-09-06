*** Keywords ***
Open Browser To Demo WebShop
    Open Browser    https://demowebshop.tricentis.com/    Chrome
    Maximize Browser Window
    Set Selenium Speed    0.5s

Login
    [Arguments]    ${email}    ${password}
    Click Link    Log in
    Input Text    id=Email    ${email}
    Input Text    id=Password    ${password}
    Click Button    css=input[value="Log in"]

Logout
    Click Link    Log out
    Page Should Contain    Register

Search Product
    [Arguments]    ${product_name}
    Input Text    id=small-searchterms    ${product_name}
    Click Button    css=input[value="Search"]

Add Product To Cart
    [Arguments]    ${product_name}
    Click Link    ${product_name}
    Click Button    css=input[value="Add to cart"]

Remove Product From Cart
    [Arguments]    ${product_name}
    Click Link    Shopping cart
    Click Button    xpath=//a[text()="${product_name}"]/ancestor::tr//input[@value="Remove"]
    Click Button    name=updatecart

Update Quantity In Cart
    [Arguments]    ${product_name}    ${qty}
    Click Link    Shopping cart
    Input Text    xpath=//a[text()="${product_name}"]/ancestor::tr//input[contains(@class,"qty-input")]    ${qty}
    Click Button    name=updatecart

Proceed To Checkout
    Click Link    Shopping cart
    Click Button    id=termsofservice
    Click Button    id=checkout
    Page Should Contain    Checkout
