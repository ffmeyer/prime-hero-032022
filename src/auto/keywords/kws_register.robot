*** Settings ***
Documentation        Aqui estarão presentes todas as keywords dos testes de cadastro
...                  do site automationpractice.com

Resource            ../../config/package.robot



*** Keywords ***
Acessar a página home do site
    Acessar a página home do site Automation Practice

Clicar em "${BUTTON}"
    Wait Until Element Is Visible    xpath=//*[contains(text(), '${BUTTON}')]
    Click Element                    xpath=//*[contains(text(), '${BUTTON}')]
    
Clicar em Create an account
    Wait Until Element Is Visible    id=SubmitCreate
    Click Element                    id=SubmitCreate
    
Informar um e-mail válido
    ${FAKE_EMAIL}                    FakerLibrary.Free Email
    Wait Until Element Is Visible    email_create
    Input Text                       email_create    ${FAKE_EMAIL}
    
Preencher os dados obrigatórios
    #debug
    ${FAKE_NAME}                    FakerLibrary.First Name
    ${FAKE_LASTNAME}                FakerLibrary.Last Name
    ${CATENATE_FULL_NAME}           Catenate                        ${FAKE_NAME}        ${FAKE_LASTNAME}    
    Set Global Variable             ${SUITE_FULL_NAME}              ${CATENATE_FULL_NAME}
    
    Wait Until Element Is Visible    ${REGISTER.form_register}

    Click Element                    ${REGISTER.check_mr}
    Input Text                       ${REGISTER.first_name}        ${FAKE_NAME}
    Input Text                       ${REGISTER.last_name}         ${FAKE_LASTNAME}
    Input Text                       ${REGISTER.password}          123456789
    
    Select From List By Value        ${REGISTER.select_days}       3
    Select From List By Value        ${REGISTER.select_months}     12
    Select From List By Value        ${REGISTER.select_year}       1994

    Input Text                       ${REGISTER.company}           Robot
    Input Text                       ${REGISTER.address1}          Robot Street

    Input Text                       ${REGISTER.city}              New York
    Select From List By Value        ${REGISTER.state}             47  #washington 
    Input Text                       ${REGISTER.postcode}          20020	
    Input Text                       ${REGISTER.other}             8888-8888
    Input Text                       ${REGISTER.mobile}            9999-9999
    Input Text                       ${REGISTER.alias}             HOME

Submeter cadastro
    Click Element                    ${REGISTER.btn_register}    

    
Conferir se o cadastro foi efetuado com sucesso
    #debug
    Wait Until Element Is Visible       css=${REGISTER.logged_user}     10s        
    ${EXPECTED_FULL_NAME}               Get Text                        css=${REGISTER.logged_user}
    Should Contain                      ${SUITE_FULL_NAME}              ${EXPECTED_FULL_NAME}

    

    
