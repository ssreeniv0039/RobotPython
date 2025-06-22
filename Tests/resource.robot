*** Settings ***
Documentation    A resource file with reusable keywords and variables
Library    SeleniumLibrary


*** Variables ***
${user_name}            rahulshettyacademy
${invalid_password}     rahul
${valid_password}       learning
${url}                  https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
open the browser for mortgauge payment url
    Create Webdriver    Chrome
    Go To    ${url}

Close Browser Session
    Close Browser