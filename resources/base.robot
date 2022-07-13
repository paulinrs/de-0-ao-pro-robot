***Settings***
Documentation       Tudo começa aqui, meu arquivo base de projeto do automação

Library     Browser
Library     Collections
Library     DateTime
Library     OperatingSystem
Library     libs/DeloreanLibrary.py


Resource        actions/auth.robot
Resource        actions/student.robot
Resource        actions/enrolls.robot
Resource        actions/plans.robot
Resource        actions/nav.robot
Resource        actions/components.robot

***Keywords***
Start Browser Sessions

    New browser    chromium                                     false
    New Page       about:blank

Start admin Sessions

    Start Browser Sessions
    Login Page
    Login With         admin@bodytest.com    pwd123
    Valid Login        Administrador

Get JSON
   [Arguments]          ${file_name}
   
   ${file}=              Get File        ${EXECDIR}/resources/fixtures/${file_name}
   ${json_object}        Evaluate        robot.utils.dotdict.DotDict(json.loads($file))

   [return]          ${json_object}     

   
    


