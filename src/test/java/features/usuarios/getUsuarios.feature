Feature: Obtener lista de usuarios

  Background:
    * url baseUrl

  Scenario: Obtener todos los usuarios exitosamente
    Given path '/usuarios'
    When method GET
    Then status 200
    And match response.quantidade == '#number'
    And match each response.usuarios contains
    """
    {
      nome: '#string',
      email: '#string',
      password: '#string',
      administrador: '#string',
      _id: '#string'
    }
    """