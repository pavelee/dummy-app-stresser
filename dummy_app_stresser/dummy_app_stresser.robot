*** Settings ***
Library     RequestsLibrary


*** Variables ***
${page}=        https://wp.pl
${lifetime}=    0
${latency}=     0


*** Tasks ***
Lets Stress some app
    IF    ${lifetime}
        Fetch Page In Interations Loop    ${page}    ${lifetime}    ${latency}
    ELSE
        Fetch Page In Infinite Loop    ${page}
    END

*** Keywords ***
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
    ${html}=    GET    ${page}
    Log To Console    ${html}
    RETURN    ${html}

Just Wait
    [Arguments]    ${latency}
    IF    ${latency} > 0
        Log To Console    Waiting ${latency} seconds...
        Sleep    ${latency}
    END
