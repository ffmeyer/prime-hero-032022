*** Settings ***
Documentation        Aqui estarão presentes todas as keywords dos testes de cadastro
...                  do site automationpractice.com

Resource            ../../config/package.robot

*** Keywords ***
Somar dois Numeros
    [Arguments]     ${NUM_A}        ${NUM_B}
    ${SOMA}         Evaluate        ${NUM_A}+${NUM_B}
    ${toString}     Convert To String       ${SOMA}
    [return]        ${toString}

Somar dois Numeros "${NUM_A}" e "${NUM_B}"
    ${SOMA}         Evaluate        ${NUM_A}+${NUM_B}
    ${to_string}     Convert To String       ${SOMA}
    [return]        ${to_string}

GeraEmail
    [Arguments]     ${NOME}     ${SOBRENOME}        ${IDADE}
    [return]        ${NOME}_${SOBRENOME}_${IDADE}@${EMAIL}

Imprimir lista de frutas
    [Arguments]     ${ITEMS}
    @{retorno}              Create List 
    FOR     ${ITEM}      IN      @{ITEMS}
        Append To List      ${retorno}      ${ITEM}
    END
    [return]        ${retorno}

Imprimir lista numerica

    [Arguments]             ${MAX_NUMBER}
    @{retorno}              Create List 
    FOR     ${NUMBER}       IN RANGE        0       ${MAX_NUMBER}
        ${to_string}         Convert To String       ${NUMBER}
        Append To List      ${retorno}      ${to_string}
    END
    [return]        ${retorno}

Imprimir lista paginada
    @{retorno}              Create List 
    FOR     ${NUMBER}       IN RANGE        0       11
        Append To List      ${retorno}      ${NUMBER} de 11
    END

    [return]        ${retorno}

Viajei para quais paises
    [Arguments]             @{PAISES}
    @{retorno}              Create List 
    FOR     ${PAIS}         IN      @{PAISES}
        Append To List      ${retorno}      Eu ja fui para ${PAIS} 
    END
    [return]        ${retorno}


for cinco ou oito
    @{retorno}              Create List
    FOR     ${NUMBER}       IN RANGE        0       11
        IF          '${NUMBER}'== '5'
            Append To List      ${retorno}      5
        ELSE IF     '${NUMBER}'== '8'        
            Append To List      ${retorno}      8
        END
    END    
    [return]        ${retorno}


Tomar Decisoes
    [Arguments]     ${NOME}
    ${MESSAGE}      Set Variable        ${EMPTY}
    IF          '${NOME}'== 'MARIA'
        ${MESSAGE}      Set Variable        vou fazer isso quando a maria        
    ELSE IF     '${NOME}'== 'JOAO'
        ${MESSAGE}      Set Variable        vou fazer isso quando o joao
    ELSE
        ${MESSAGE}      Set Variable        qualquer outra pessoa    
    END
    [return]        ${MESSAGE}
           


Tomar Decisoes OR
    [Arguments]     ${NOME}
    ${MESSAGE}      Set Variable        ${EMPTY}
    IF          '${NOME}'== 'MARIA' or '${NOME}'== 'JOAO'
        ${MESSAGE}      Set Variable        vou fazer isso quando a joao OU maria
    ELSE
        ${MESSAGE}      Set Variable        qualquer outra pessoa    
    END
    [return]        ${MESSAGE}