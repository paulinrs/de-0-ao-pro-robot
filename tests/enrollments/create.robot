***Settings***
Documentation    Gestão de Matriculas

Resource    ${EXECDIR}/resources/base.robot

Suite Setup    Start admin Sessions

***Test Cases***

Deve exibir data inicial e final conforme o plano escolhido

    ${fixture}          Get JSON              enroll.json 

    ${bones}            Set Variable          ${fixture['student']}
    ${rowena}           Set Variable          ${fixture['plan']} 
    Insert Student                ${bones}
    Insert Plan                    ${rowena} 
    Go To Enrolls
    Go To Form Enrolls
    Select Student            ${bones['name']}  
    Select Plan              ${rowena['title']} 
    Start Date Shold Today 
    End Date Shold Be          ${fixture['days']}

Deve matricular um aluno em um plano    
    ${fixture}          Get JSON              enroll.json 

    ${potter}            Set Variable          ${fixture['potter']}
    ${smart}           Set Variable            ${fixture['smart']} 
    Insert Student                 ${potter}
    Insert Plan                    ${smart} 
    Go To Enrolls
    Go To Form Enrolls
    Select Student            ${potter['name']}  
    Select Plan               ${smart['title']} 
    Save Plan
    Toaster Text Should Be    Matrícula cadastrada com sucesso

Deve achar plano com ordem alfabetica maior    


    ${fixture}          Get JSON              enroll.json 

    ${cho_chang}            Set Variable          ${fixture['cho_chang']}
    ${ravenclaw}           Set Variable            ${fixture['ravenclaw']} 
    Insert Student                 ${cho_chang}
    Insert Plan                    ${ravenclaw} 
    Go To Enrolls
    Go To Form Enrolls
    Select Student            ${cho_chang['name']}  
    No Records Found          ${ravenclaw['title']}
    Take Screenshot
    #desde que tento cadastrar um novo aluno em um plano que não esta entre 5 
    #primeiros em ordem alfabetica o mesmo não aparece.
    Go To Plans
    Search Plan Enrolls            ${ravenclaw['title']}     
    Take Screenshot   