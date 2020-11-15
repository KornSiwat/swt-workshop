*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FacebookLoginEmail}    myemail
${FacebookLoginPassword}    mypassword
${FacebookUrl}    https://www.facebook.com
${Browser}    chrome
${SigninButton}    //*[@id="u_0_b"]
${PostBox}    //*[@id="mount_0_0"]/div/div[1]/div[1]/div[3]/div/div/div[1]/div[1]/div/div[2]/div/div/div[3]/div/div[2]/div/div/div/div[1]/div
${PostTextBox}    //*[@id="mount_0_0"]/div/div[1]/div[1]/div[4]/div/div/div[1]/div/div[2]/div/div/div/form/div/div[1]/div/div/div[2]/div[1]/div[1]/div[1]/div/div/div/div/div[2]/div/div/div/div
${PostButton}    //*[@id="mount_0_0"]/div/div[1]/div[1]/div[4]/div/div/div[1]/div/div[2]/div/div/div/form/div/div[1]/div/div/div[3]/div[2]/div

*** Test Cases ***
Post Facebook
    Open Chrome
    Fill In Signin Form
    Signin
    Wait Until Homepage Render
    Click Post Box
    Wait Until Post Box Pop up
    Fill In Post Text
    Post

*** Keywords ***
Open Chrome
    Open Browser    ${FacebookUrl}   ${Browser}

Fill In Signin Form
    Input Text    email    ${FacebookLoginEmail}
    Input Text    pass    ${FacebookLoginPassword}

Signin
    Click Element    xpath:${SigninButton}

Wait Until Homepage Render
    Wait Until Page Contains Element    xpath:${PostBox}

Click Post Box
    Click Element    xpath:${PostBox}

Wait Until Post Box Pop up
    Wait Until Page Contains Element    xpath:${PostTextBox}     

Fill In Post Text
    Press Keys    xpath:${PostTextBox}    สวัสดี Robot Framework

Post
    Click Element    xpath:${PostButton}
























