Feature: Obtener lista de usuarios

  Background:
    * url baseUrl

    @todos
  Scenario: Obtener todos los usuarios exitosamente
    #Given url 'https://serverest.dev/usuarios'
    Given path '/usuarios'
    When method GET
    Then status 200
      And match response.quantidade == '#number'

