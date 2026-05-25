Feature: Eliminar usuario

  Background:
    * url baseUrl
    * def dataGenerator = call read('classpath:helpers/DataGenerator.js')

  Scenario: Eliminar usuario exitosamente
    * def usuario = dataGenerator.usuario

    Given path '/usuarios'
    And request usuario
    When method POST
    Then status 201

    * def userId = response._id

    Given path '/usuarios', userId
    When method DELETE
    Then status 200
    And match response.message == 'Registro excluído com sucesso'