Feature: Buscar usuario por ID

  Background:
    * url baseUrl
    * def dataGenerator = call read('classpath:helpers/DataGenerator.js')
    * def usuario = dataGenerator.usuario

  Scenario: Buscar usuario existente
    Given path '/usuarios'
    And request usuario
    When method POST
    Then status 201

    * def userId = response._id

    Given path '/usuarios', userId
    When method GET
    Then status 200
    And match response.nome == usuario.nome
    And match response.email == usuario.email

  Scenario: Buscar usuario inexistente
    Given path '/usuarios', '123456'
    When method GET
    Then status 400
    And match response.message == 'Usuário não encontrado'