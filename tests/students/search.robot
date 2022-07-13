***Settings***
Documentation    Buscar Alunos
Resource         ${EXECDIR}/resources/base.robot

Suite Setup    Start admin Sessions

***Test Cases***

Busca Exata
    &{student}        Create Dictionary    name=Neville Longbottom    email=neville_longbotton@hogwarts.com    age=42    weight=93.5    feet_tall=1.91    
    
    Remove Student By Name         ${student.name}
    Insert Student                 ${student}        
    Go To Students
    Search Student By Name         ${student.name}
    Name Should Visible            ${student.name}	
    Total Items Should Be           1
    
Registro não encontrado
    &{student}        Create Dictionary    name=Alvo Dumbledore    email=alvo.dumbledore@hogwarts.com    age=115    weight=91.5    feet_tall=1.90   
    Insert Student                 ${student} 
    Remove Student By Name         ${student.name}
    Go To Students
    Search Student By Name         ${student.name}
    Register Should Not Be Fould

Busca Alunos Por um único termo

 
   ${fixture}        Get JSON              students-search.json
   ${students}       Set Variable          ${fixture.students} 

   ${word}           Set Variable          ${fixture.word}
   ${total}          Set Variable          ${fixture.total}

   Remove Student By Name        ${word}

   FOR        ${item}      IN     @{students}
            Insert Student        ${item} 
   END     

   Go To Students             
   Search Student By Name        ${word}

    FOR        ${item}      IN     @{students}
            Name Should Visible        ${item.name}
    END

   Total Items Should Be           ${total}        
  

