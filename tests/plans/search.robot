***Settings***
Documentation    Buscar Planos

Resource    ${EXECDIR}/resources/base.robot

Suite Setup    Start admin Sessions

***Test Cases***

Busca Exata

    &{plan}    Create Dictionary    title=Smart Slytherin  duration=12    price=34,99    total=R$ 419,88

    Remove Plan               ${plan.title}
    Go To Plans
    Go To Form Plan
    Fill Form Plan             ${plan}                       
    Search Plan By Name         ${plan.title}
    Name Should Visible         ${plan.title}
    Total Items Should Be           1
  
Registro não encontrado  

    &{plan}    Create Dictionary    title=Hogwarts   duration=1    price=100,00    total=R$ 100,00

    Remove Plan                ${plan.title}
    Go To Plans
    Go To Form Plan
    Fill Form Plan              ${plan}                       
    Remove Plan                 ${plan.title}
    Search Plan By Name         ${plan.title}
    Name Should Not Visible     ${plan.title}
    Register Should Not Be Fould

Busca plano Por um único termo

     
    &{Gold}    Create Dictionary    title=Gryffindor Gold    duration=12    price=19,90    total=R$ 238,80
    Remove Plan               ${Gold.title}
    Go To Plans
    Go To Form Plan
    Fill Form Plan             ${Gold}                       
    &{Black}    Create Dictionary    title=Gryffindor Black   duration=24    price=14,90    total=R$ 357,60
    Remove Plan               ${Black.title}
    Go To Plans
    Go To Form Plan
    Fill Form Plan             ${Black}                       
    Total Visible Plans
    