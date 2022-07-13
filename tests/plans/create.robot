***Settings*** 
Documentation    Cadastro de Planos

Resource        ${EXECDIR}/resources/base.robot

Suite Setup    Start admin Sessions

***Test Cases***

Criando e calculando preço total do plano
    &{plan}         Create Dictionary      title=Hufflepuff     duration=6    price=24.99    total=R$ 149,94
    
    Remove Plan          ${plan.title}
    Go To Plans
    Go To Form Plan
    Fill Form Plan          ${plan}  
    Total Plan Should Be    ${plan.total} 
    Toaster Text Should Be      Plano cadastrado com sucesso

Criando plano em duplicidade    
#o ideal era que não permitisse cadastrar dois planos com mesmo nome
    &{plan1}         Create Dictionary      title=x repeated     duration=6    price=00,00    total=R$ 0,00
    &{plan2}         Create Dictionary      title=x repeated     duration=12    price=00,00    total=R$ 0,00
    
    Remove Plan          ${plan1.title}
    Go To Plans
    Go To Form Plan
    Fill Form Plan          ${plan1}  
    Toaster Text Should Be      Plano cadastrado com sucesso  

    &{plan2}         Create Dictionary      title=x repeated     duration=12    price=00,00    total=R$ 0,00
    Go To Plans
    Go To Form Plan
    Fill Form Plan              ${plan2} 
    Search Plan By Name         ${plan2.title}
    Name Should Visible         ${plan2.title}
    Total Items Should Be           2
    Toaster Text Should Be      Plano cadastrado com sucesso
    Take Screenshot