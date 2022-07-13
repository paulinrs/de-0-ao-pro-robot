***Settings***
Documentation       Ações de cadastro de alunos

***Variables***

${NAME}                      css=input[name=name]         
${EMAIL}                     css=input[name=email]       
${AGE}                       css=input[name=age]         
${WEIGHT}                    css=input[name=weight]       
${FEET_TALL}                 css=input[name=feet_tall]


***Keywords***

Go To Form Student
    Set Strict Mode    False
    click                      css=a[href$="alunos/new"]
    Wait For Elements State    css=h1 >> text=Novo aluno    Visible    5

Submit Student Form
    click        css=button[form=formStudent]
    

Fill Form Student
    [Arguments]     ${student}

    Fill Text    ${NAME}         ${student.name}
    Fill Text    ${EMAIL}        ${student.email}
    Fill Text    ${AGE}          ${student.age}
    Fill Text    ${WEIGHT}       ${student.weight}
    Fill Text    ${FEET_TALL}    ${student.feet_tall}
    Submit Student Form

Check Tipe Field On Student Form
    [Arguments]    ${element}   ${type}

    Go To Students
    Go To Form Student
    Field Should Be Type    ${element}    ${type}

    Submit Student Form


Delete Student Button
    [Arguments]         ${email}

    Click               xpath=//td[contains(text(), "${email}")]/../td//button[@id="trash"]

Search Student By Name
    [Arguments]     ${name}
    Fill Text       css=input[placeholder="Buscar aluno"]    ${name}

Go To Update Form
    [Arguments]              ${email}

    Click                       xpath=//td[contains(text(),"${email}")]/..//a[@class="edit"]
    Wait For Elements State    css=h1 >> text=Edição de aluno    Visible    5


