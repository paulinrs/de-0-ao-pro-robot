***Settings***
Documentation       Ações de cadastro de planos

***Variables***
${TITTLE}             id=title  
${DURATION}           id=duration
${PRICE}              css=input[name=price]
${TOTAL.PRICE}        css=input[name=total] 


***Keywords***
Submit Plan Form
    click        xpath=//button[contains(text(), "Salvar")]
    

Fill Form Plan
    [Arguments]     ${plan}

    Fill Text    ${TITTLE}          ${plan.title}
    Fill Text    ${DURATION}        ${plan.duration}
    Fill Text    ${PRICE}           ${plan.price}
    Save Plan

Delete Plan 
    [Arguments]      ${search}   ${title}
    
    Fill Text       css=input[placeholder="Buscar plano"]    ${search}

    Click               xpath=//td[contains(text(), "${title}")]/../td//button[@id="trash"]    

   


Go To Form Plan
    Set Strict Mode    False
    click                      css=a[href$="planos/new"]
    Wait For Elements State    css=h1 >> text=Novo plano    Visible    5

Total Plan Should Be   

    [Arguments]         ${total}

    Get Attribute       ${TOTAL.PRICE}             value       ==      ${total}


Search Plan By Name 

    [Arguments]     ${name}
    Fill Text       css=input[placeholder="Buscar plano"]    ${name}        

Total Visible Plans

    Search Plan By Name         Gryffindor
    Name Should Visible         Gryffindor
    Total Items Should Be       2

Go To Plans Update Form
    [Arguments]              ${price}

    Click                       xpath=//td[contains(text(),"${price}")]/..//a[@class="edit"]
    
    Wait For Elements State     css=h1 >> text=Edição de plano              

    
