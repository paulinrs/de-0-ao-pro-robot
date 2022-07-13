***Settings***
Documentation       Ações de componentes genéricos

****Keywords****

Alert Text Should Be
    [Arguments]         ${expect_text}

    Wait For Elements State     css=form span >>text=${expect_text}     visible     5

Confirm Removal
    [Arguments]             ${Confirm}

    Click                      text=${Confirm}    

Deletion Page

    Wait For Elements State    text=Você está certo disso?    Visible                      5    

Field Should Be Type
    [Arguments]         ${elements}         ${type}

    ${attr}            Get Attribute            ${elements}      type
    Should Be Equal     ${attr}         ${type}

Get Required Alerts
    [Arguments]     ${index}

    ${span}       Get Text       xpath=(//form//span)[${index}]    

    [Return]        ${span}

Name Should Visible  
    [Arguments]         ${name}

    Wait For Elements State        xpath=//td[contains(text(), "${name}")]     Visible        5  

Name Should Not Visible  
    [Arguments]         ${name}

    Wait For Elements State        xpath=//td[contains(text(), "${name}")]     detached        5      

Register Should Not Be Fould    

    Wait For Elements State        text=Nenhum registro encontrado.     Visible         5
    Wait For Elements State        css=table                            detached        5

Toaster Text Should Be
    [Arguments]         ${expect_text}

    Wait For Elements State    css=.Toastify__toast-body >> text=${expect_text}    visible    5

Total Items Should Be
    [Arguments]         ${number}

    ${element}      Set Variable        css=#pagination .total 
    Wait For Elements State     ${element}       Visible        5
    Get Text                    ${element}      ==      Total: ${number}

Save Plan    

    click               xpath=//button[contains(.,'Salvar')]    

