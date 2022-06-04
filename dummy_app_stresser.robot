*** Settings ***
Library    RequestsLibrary

*** Variables ***
${page}=    https://wp.pl
${lifetime}=    30
${latency}=    0

*** Tasks ***
Lets be kind
    ${iteration}=    Set Variable    ${1}
    WHILE    ${iteration} <= ${lifetime}
        Log To Console    Getting ${page}, iteration: ${iteration} 
        ${html}=    GET    ${page}
        Log To Console    ${html}
        ${iteration}=    Set Variable    ${iteration + 1}
        IF    ${latency} > 0
            Log To Console    Waiting ${latency} seconds...
            Sleep    ${latency}            
        END
    END