***Settings***
Documentation    Remover Alunos
Resource         ${EXECDIR}/resources/base.robot

Suite Setup    Start admin Sessions

***Test Cases***
Remover Aluno Cadastrado

    &{student}        Create Dictionary    name=Simas Finnigan    email=simasfinnigan@hogwarts.com    age=42    weight=78.5    feet_tall=1.71   
    Insert Student                 ${student}           
    Go To Students
    Search Student By Name         ${student.name}
    Delete Student Button          ${student.email}
    Deletion Page
    Confirm Removal                SIM, pode apagar!
    Toaster Text Should Be         Aluno removido com sucesso.
    Name Should Not Visible    ${student.email}

Desistir de Remover Aluno

    &{student}        Create Dictionary    name=Gina Potter    email=gina.potter@hogwarts.com    age=40    weight=54.5    feet_tall=1.67    
    Insert Student                ${student}           
    Go To Students
    Search Student By Name        ${student.name}
    Delete Student Button         ${student.email}
    Deletion Page
    Confirm Removal               não
    Name Should Visible        ${student.email}
    