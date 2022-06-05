*** Settings ***
#Library    RequestsLibrary
Library     Browser


*** Variables ***
${page}=        https://wp.pl
${lifetime}=    0
${latency}=     0

# docker run -d -e ROBOT_OPTIONS="-v page:https://wp.pl -v lifetime:0 -v latency:0" stresser:latest

*** Tasks ***
Lets Stress some app
    IF    ${lifetime}
        Fetch Page In Interations Loop    ${page}    ${lifetime}    ${latency}
    ELSE
        Fetch Page In Infinite Loop    ${page}
    END


*** Keywords ***
Start Browser
    New Browser    firefox    headless=0    slowMo=0.1
    New Context    viewport={'width': 1920, 'height': 1080}    acceptDownloads=true    recordVideo={'dir': 'video'}
    New Page

End Browser
    Close Browser

Fetch Page In Infinite Loop
    [Arguments]    ${page}
    WHILE    True
        Log To Console    Getting ${page}, infinte!
        ${html}=    Fetch Page    ${page}
        Just Wait    ${latency}
    END

Fetch Page In Interations Loop
    [Arguments]    ${page}    ${iterations}=30    ${latency}=0
    ${iteration}=    Set Variable    ${1}
    WHILE    ${iteration} <= ${lifetime}
        Log To Console    Getting ${page}, iteration: ${iteration}
        ${html}=    Fetch Page    ${page}
        ${iteration}=    Set Variable    ${iteration + 1}
        Just Wait    ${latency}
    END

Fetch Page
    [Arguments]    ${url}
    Start Browser
    Go To    ${url}
    Take Screenshot
    End Browser

Just Wait
    [Arguments]    ${latency}
    IF    ${latency} > 0
        Log To Console    Waiting ${latency} seconds...
        Sleep    ${latency}
    END
