***Settings***
Documentation       menu superior de navegação

***Keywords***

Go To Students
    Click                      css=a[href$=alunos]
    Wait For Elements State    css=h1 >> text=Gestão de Alunos        Visible    5

Go To Plans

    Click                      css=a[href$=planos]
    Wait For Elements State    css=h1 >> text=Gestão de Planos        Visible    5

Go To Enrolls

    Click                      css=a[href$=matriculas]
    Wait For Elements State    css=h1 >> text=Gestão de Matrículas        Visible    5

Valid Login
    [Arguments]         ${user_name}

    Get Text           css=aside strong     should be    ${user_name}
   

