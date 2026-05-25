Feature: Actualizar usuario

  Background:
    * url baseUrl
    * def dataGenerator = call read('../helpers/DataGenerator.js')

  Scenario: Actualizar usuario exitosamente
    * def usuario = dataGenerator.usuario

    Given path '/usuarios'
    And request usuario
    When method POST
    Then status 201

    * def userId = response._id

    * set usuario.nome = 'Usuario Actualizado'

    Given path '/usuarios', userId
    And request usuario
    When method PUT
    Then status 200
    And match response.message == 'Registro alterado com sucesso'