*** Settings ***
Documentation        Aqui estarão presentes todas as keywords dos testes de pesquisa
...                  do site automationpractice.com

Resource            ../../config/package.robot

*** Keywords ***
Acessar a página home do site Automation Practice
    Title Should Be                  ${HOME_PAGE.title}
    Wait Until Element Is Visible    ${HOME_PAGE.input_busca}        10

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text                       ${HOME_PAGE.input_busca}        ${PRODUTO}

Clicar no botão pesquisar
    Wait Until Element Is Visible    ${HOME_PAGE.btn_buscar}
    Click Element                    ${HOME_PAGE.btn_buscar}

Conferir se o produto Blouse foi listado no site
    Wait Until Element Is Visible    ${PRODUTO_PAGE.img_blouse}   
    Page Should Contain Image        ${PRODUTO_PAGE.img_blouse}    

Conferir mensagem "${MENSAGEM}"
    Wait Until Page Contains    ${MENSAGEM}


Acessar o menu "summer dresses"
    
    Wait Until Element Is Visible    xpath=${PRODUTO_PAGE.mouse_over_dress}
    Mouse Over                       xpath=${PRODUTO_PAGE.mouse_over_dress} 
    Set Focus To Element             xpath=${PRODUTO_PAGE.mouse_over_dress} 

    Wait Until Element Is Visible    xpath=${PRODUTO_PAGE.mouse_over_summer_dress}        10
    Mouse Over                       xpath=${PRODUTO_PAGE.mouse_over_summer_dress}
    Set Focus To Element             xpath=${PRODUTO_PAGE.mouse_over_summer_dress}
    Click Element                    xpath=${PRODUTO_PAGE.mouse_over_summer_dress}
    
Validar quantidade de tres vestidos exibidos
    Wait Until Element Is Visible    xpath=${PRODUTO_PAGE.category_name}        
    Should Contain                   xpath=${PRODUTO_PAGE.product_count}        ${PRODUTO_PAGE.expected_count}

