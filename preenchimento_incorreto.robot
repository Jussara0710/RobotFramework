*** Settings ***
Library         SeleniumLibrary
Resource        setup_teardown.robot
Test Setup      Dado que eu acesse o Organo
Test Teardown   Fechar o navegador

*** Variables ***
${CAMPO_CARD}      id:form-botao
${TEMPO_ESPERA}    2s  

*** Test Cases ***
Verificar se ao preencher corretamente o formulário os dados são inseridos corretamente na lista e se um novo card é criado no time esperado
    Dado que eu clique no botão criar card
    Sleep    ${TEMPO_ESPERA}  
    Então o sistema deve apresentar mensagem de campo obrigatório
    Validar campos e rolar para metade da tela

*** Keywords ***
Dado que eu clique no botão criar card
    Click Element    ${CAMPO_CARD}

Então o sistema deve apresentar mensagem de campo obrigatório
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro
    Validar campos e rolar para metade da tela

Validar campos e rolar para metade da tela
    
    Execute Javascript    window.scrollBy(0, window.innerHeight / 2);  
