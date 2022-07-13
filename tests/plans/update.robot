***Settings***
Documentation    Ataualizar plans
Resource         ${EXECDIR}/resources/base.robot

Suite Setup    Start admin Sessions

***Test Cases***
Atualizar plano já cadastrado

    ${fixture}      Get JSON       plans-update.json
    ${lufa lufa}     Set Variable     ${fixture['before']} 
    ${rowena}        Set Variable     ${fixture['after']}


    Remove Plan                 ${lufa lufa.title}
    Remove Plan                 ${rowena.title}
    Insert Plan                 ${lufa lufa}
    Go To Plans
    Search Plan By Name         ${lufa lufa.title}
    Go To Plans Update Form     ${lufa lufa.title} 
    Fill Form Plan              ${rowena}
    # Save Plan
    Toaster Text Should Be        Plano Atualizado com sucesso
    

   