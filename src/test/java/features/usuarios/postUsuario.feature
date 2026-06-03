Feature: Registrar usuario

  Background:
    * url baseUrl
    * def dataGenerator = call read('classpath:helpers/DataGenerator.js')
    * def usuario = dataGenerator.usuario

  Scenario: Caso Positivo - Registrar usuario exitosamente
    Given path '/usuarios'
    And request usuario
    When method POST
    Then status 201
#    And match response.message == 'Cadastro realizado com sucesso'
#    And match response._id == '#string'

  Scenario: Caso Negativo - Registrar usuario con email existente

    Given path '/usuarios'
    And request {"nome": "Teste", "email": "fulano@qa.com", "password": "123456", "administrador": "true"}
    When method POST
    Then status 400
    And match response.message == 'Este email já está sendo usado'