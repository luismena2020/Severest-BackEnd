Feature: Registrar usuario

  Background:
    * url baseUrl
    * def dataGenerator = call read('classpath:helpers/DataGenerator.js')
    * def usuario = dataGenerator.usuario

  Scenario: Registrar usuario exitosamente
    Given path '/usuarios'
    And request usuario
    When method POST
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    And match response._id == '#string'

  Scenario: Registrar usuario duplicado
    Given path '/usuarios'
    And request usuario
    When method POST
    Then status 201

    Given path '/usuarios'
    And request usuario
    When method POST
    Then status 400
    And match response.message == 'Este email já está sendo usado'