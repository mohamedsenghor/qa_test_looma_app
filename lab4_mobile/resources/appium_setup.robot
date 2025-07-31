*** Settings ***
Library    AppiumLibrary

*** Keywords ***
Start Session
    ${desired_caps}=    Create Dictionary
    ...    platformName=Android
    ...    platformVersion=16
    ...    deviceName=Medium Phone API 36
    ...    automationName=UiAutomator2
    ...    app=/home/mohamed/Documents/ISI_Courses/QA_Test/EXAMEN_QA_TEST/lab4_mobile/app-looma.apk
    ...    noReset=${False}
    ...    appPackage=sn.sonatel.dsi.moussa.wade.moussawade
    ...    appActivity=.MainActivity
    
    Open Application    http://localhost:4723    &{desired_caps}    strict_ssl=False
    Set Appium Timeout    30 seconds

End Session
    Run Keyword And Ignore Error    Close Application
