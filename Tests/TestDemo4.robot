*** Settings ***
Documentation    verify the Login Successful
Library    SeleniumLibrary
Test Teardown    Close Browser 

*** Variables ***




*** Test Cases ***
1.1 Verify the Login
    [Documentation]    WHEN the user launch the web URL ${/n}
...    THEN login page is displayed ${/n}
    open the browser for mortgauge payment url

    
1.1 Verify the Login
    [Documentation]    WHEN the user launch the web URL ${/n}
...    THEN login page is displayed ${/n}
    open the browser for mortgauge payment url

    
*** Keywords ***
open the browser for mortgauge payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/




