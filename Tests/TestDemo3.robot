*** Settings ***
Documentation    verify the login
Library    SeleniumLibrary
Test Teardown    Close Browser


*** Variables ***
${error_message_login}    css:.alert-danger

*** Test Cases ***
Validate Unsuccessful login
    open the browser for mortgauge payment url
    enter the username and password
    tap on the submit button
    waituntill the error message shows up
    verify the error message

*** Keywords ***
open the browser for mortgauge payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

enter the username and password
    Input Text    id:username    rahulshettyacademy
    Input Text    id:password    rahul

tap on the submit button
    Click Button    id:signInBtn

waituntill the error message shows up
    Wait Until Element Is Visible    css:.alert-danger
    
verify the error message
    ${result}=    Get Text    css:.alert-danger
    Should Be Equal As Strings    ${result}    Incorrect username/password.






