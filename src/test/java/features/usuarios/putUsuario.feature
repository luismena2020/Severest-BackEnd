Feature: Actualizar usuario

  Background:
    * url baseUrl


#  Scenario: Actualizar usuario existente
#
#
#    Given path '/usuarios/hapcOrE8faeCTtvL'
#    And request {"nome": "Usuario Actualizado","email": "usuarioxxxxx@mail.com","password": "444444","administrador": "false"}
#    When method PUT
#    Then status 200
#    And match response.message == 'Registro alterado com sucesso'

  Scenario: Caso Positivo - Actualizar usuario

    * def DataGenerator = call read('classpath:helpers/DataGenerator.js')
    * def usuario = DataGenerator.usuario
    Given path '/usuarios'
    And request usuario
    When method POST
    Then status 201

    * def userId = response._id

    * def usuarioActualizado =
    """
    {
      "nome": "Usuario Actualizado",
      "email": "#(usuario.email)",
      "password": "999999",
      "administrador": "false"
    }
    """
    Given path '/usuarios', userId
    And request usuarioActualizado
    When method PUT
    Then status 200
    And match response.message contains 'Registro alterado com sucesso'


  Scenario: Caso Negativo - Actualizar usuario inexistente

    Given path '/usuarios', 'abc123'
    And request
    """
  {
  "nome":"Test",
  "email":"test@test.com",
  "password":"123456",
  "administrador":"true"
  }
   """
    When method PUT

    Then status 201 || status 400