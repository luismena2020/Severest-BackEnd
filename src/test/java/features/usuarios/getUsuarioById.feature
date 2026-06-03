Feature: Buscar usuario por ID

  Background:
    * url baseUrl
    * def dataGenerator = call read('classpath:helpers/DataGenerator.js')
    * def usuario = dataGenerator.usuario

    @porid
  Scenario: Caso Positivo - Buscar usuario existente
    Given path '/usuarios/9dsDPwmuWW5tHtxo'
    When method GET
    Then status 200

  Scenario: Caso Negativo - Buscar usuario inexistente

    Given path '/usuarios/xxxxxxxxxxxxxxxx'
    When method GET
    Then status 400
    And match response.message contains 'Usuário não encontrado'