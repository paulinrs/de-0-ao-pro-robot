***Settings***
Documentation    Deletar Planos

Resource    ${EXECDIR}/resources/base.robot

Suite Setup    Start admin Sessions

***Test Cases***

Remover Plano Cadastrado

    &{plan}    Create Dictionary    title=Grifinoria    duration=6    price=24,99    total=R$ 149,94

    Remove Plan              ${plan.title}
    Go To Plans
    Go To Form Plan
    Fill Form Plan             ${plan}                       
    Delete Plan                ${plan.title}                 ${plan.price}
    Confirm Removal            SIM, pode apagar!
    Toaster Text Should Be     Plano removido com sucesso
    Name Should Not Visible    ${plan.title}

Desistir de Remover Plano

     &{plan}    Create Dictionary    title=Ravenclaw    duration=3    price=29,99    total=R$ 89,97

    Remove Plan              ${plan.title}
    Go To Plans

    Go To Form Plan
    Fill Form Plan            ${plan}                         
    Toaster Text Should Be    Plano cadastrado com sucesso
    Delete Plan               ${plan.title}                   ${plan.price}
    Confirm Removal           Não
    Name Should Visible       ${plan.title}

