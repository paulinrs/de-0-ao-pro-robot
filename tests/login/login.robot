***Settings***
Documentation    Suite de testes de Login do Administrador

Resource    ${EXECDIR}/resources/base.robot

Suite Setup     Start Browser Sessions


***Test Cases***
Login do Administrador

    Login Page
    Login With         admin@bodytest.com    pwd123
    Valid Login        Administrador
    LocalStorage Clear

Senha Incorreta

    Login Page
    Login With               admin@bodytest.com           abc123
    Toaster Text Should Be    Usuário e/ou senha inválido

Email não Cadastrado

    Login Page
    Login With               arthurr.rs@gmail.com           abc123
    Toaster Text Should Be    Usuário e/ou senha inválido

Email Incorreto

    Login Page
    Login With             admin*bodytest.com          pwd123
    Alert Text Should Be    Informe um e-mail válido    

Senha não informada

    Login Page
    Login With             admin@bodytest.com       ${EMPTY}
    Alert Text Should Be    A senha é obrigatória

Não informo o email, mas informo a senha

    Login Page
    Login With             ${EMPTY}                  pwd123
    Alert Text Should Be    O e-mail é obrigatório

Não informo o email e senha

    Login Page
    Login With             ${EMPTY}                  ${EMPTY}
    Alert Text Should Be    O e-mail é obrigatório    
    Alert Text Should Be    A senha é obrigatória     