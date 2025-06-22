*** Settings ***
Documentation      verify the login
Library            SeleniumLibrary
Library            Collections
Test Setup         open the browser for mortgauge payment url
#Test Teardown      Close Browser Session
Resource           resource.robot



*** Variables ***
${error_message_login}    css:.alert-danger
${shop_page_load}         css:.nav-link

*** Test Cases ***
Validate Unsuccessful login
    enter the username and password    ${username}    ${invalid_password}
    tap on the submit button
    wait until the element is loaded    ${error_message_login}
    verify the error message

Validate successful login
    enter the username and password    ${username}    ${valid_password}
    tap on the submit button
    wait until the element is loaded    ${shop_page_load}
    verify the shop titles in the shop page
    select the card    Nokia Edge  
    Sleep    10    wait time

*** Keywords ***
enter the username and password
    [arguments]    ${username}    ${password}
    Input Text    id:username    ${user_name}
    Input Text    id:password    ${password}

tap on the submit button
    Click Button    id:signInBtn

wait until the element is loaded
    [arguments]    ${element}
    Wait Until Element Is Visible    ${element}
    
verify the error message
    ${result}=    Get Text    css:.alert-danger
    Should Be Equal As Strings    ${result}    Incorrect username/password.

verify the shop titles in the shop page
    @{expected_list} =     Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    @{actual_list} =    Create List    
    @{elements}=    Get Webelements    css:.card-title
    FOR    ${element}    IN     @{elements}
        Log    ${element.text}
        Append To List    ${actual_list}    ${element.text}
    END
    Lists Should Be Equal    ${actual_list}    ${expected_list}

select the card
    [arguments]    ${card_name}
    ${index}=    Set Variable    1
    @{elements}=    Get Webelements    css:.card-title
    FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${card_name}' == '${element.text}'
        ${index}=    Evaluate    ${index} + 1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button






