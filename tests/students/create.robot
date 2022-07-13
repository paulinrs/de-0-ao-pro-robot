***Settings***
Documentation    Cadastro de Alunos
Resource        ${EXECDIR}/resources/base.robot

Suite Setup    Start admin Sessions

***Test Cases***
Novo aluno

   &{student}               Create Dictionary                name=Harry Potter    email=harry.potter@hogwarts.com    age=41    weight=73.5    feet_tall=1.70    
   Remove Student           ${student.email}
   Go To Students
   Go To Form Student       
   Fill Form Student              ${student}
   Toaster Text Should Be    Aluno cadastrado com sucesso.

Não permitir email duplicado

   &{student}    Create Dictionary    name=Draco Malfoy    email=draco_malfoy@hogwarts.com    age=42    weight=72    feet_tall=1.73    

   Insert Student           ${student}
   Go To Students
   Go To Form Student       
   Fill Form Student              ${student}
   Toaster Text Should Be    Email já existe no sistema.

Todos os campos são obrigatórios


   @{expected_alerts}     Set Variable    Nome é obrigatório    O e-mail é obrigatório    idade é obrigatória    o peso é obrigatório    a Altura é obrigatória
   @{got_alerts}          Create List
   Go To Students
   Go To Form Student
   Submit Student Form    

   FOR                ${index}               IN RANGE           1    6    
   ${student_data}    Get Required Alerts    ${index}
   Append To List     ${got_alerts}          ${student_data}    
   END

   Log    ${expected_alerts}
   Log    ${got_alerts}

   Lists Should Be Equal    ${expected_alerts}    ${got_alerts}

Validação de campo numéricos

   [Template]    Check Tipe Field On Student Form

   ${AGE}          number
   ${WEIGHT}       number 
   ${FEET_TALL}    number

Validar campo de tipo email

   [Template]    Check Tipe Field On Student Form

   ${EMAIL}    email

Menor de 14 anos não pode fazer cadastro

   &{student}                 Create Dictionary        name=Lílian Luna Potter    email=lilian.lunapotter@com.hogwarts    age=13    weight=51.5    feet_tall=1.59    
   
   Go To Students
   Go To Form Student         
   Fill Form Student                ${student}
   Alert Text Should Be       A idade deve ser maior ou igual 14 anos
