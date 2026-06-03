Feature: Eliminar usuario

  Background:
    * url baseUrl

#  Scenario: Eliminar usuario exitosamente
#
#    Given path '/usuarios/zVUfQhrpLUfMu7CD'
#    When method DELETE
#    Then status 200
#    And match response.message == 'Registro excluído com sucesso'

  Scenario: Caso Positivo - Eliminar usuario

    * def DataGenerator = call read('classpath:helpers/DataGenerator.js')
    * def usuario = DataGenerator.usuario
    Given path '/usuarios'
    And request usuario

    When method POST

    Then status 201

    * def userId = response._id

    Given path '/usuarios', userId

    When method DELETE

    Then status 200

    And match response.message contains 'Registro excluído com sucesso'


  Scenario: Caso Negativo - Eliminar usuario inexistente

    Given path '/usuarios', 'abc123'

    When method DELETE

    Then status 200

    And match response.message contains 'Nenhum registro excluído'