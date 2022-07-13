***Settings***
Documentation    Ataualizar Alunos
Resource         ${EXECDIR}/resources/base.robot

Suite Setup    Start admin Sessions

***Test Cases***
Atualizar Aluno já cadastrado
    
    ${fixture}      Get JSON        students-update.json

    ${lovegood}     Set Variable    ${fixture['before']} 
    ${scamander}    Set Variable    ${fixture['after']}

    Remove Student By Name       ${lovegood['name']}
    Remove Student By Name       ${scamander['name']}
   
    Insert Student              ${lovegood}   
    Go To Students  
    Search Student By Name      ${lovegood['name']} 
    Go To Update Form           ${lovegood['email']}
    Fill Form Student           ${scamander}
    Toaster Text Should Be      Aluno atualizado com sucesso.


    
