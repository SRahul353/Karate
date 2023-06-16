Feature: Pet Store User API Test


#Setup Background
  Background:
    * url 'https://petstore.swagger.io/v2'
    * header accept = 'application/json'
    * def payload = read('UserResponse.json')
    * def data = read('UserData.json')

#POST Request with PostResponse payload
  Scenario: POST API Test with PostResponse payload
    Given path '/user'
    Then print data
    And request data
    When method POST
    Then status 200
    And match response == payload [1]


# GET request with Background
  Scenario: GET API Test with Background
    Given path '/user/QATest'
    When method GET
    Then status 200
    And print response
    And match response == data

