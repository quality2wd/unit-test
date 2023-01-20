Feature: Sign Up Patient
  In The Manage patient Owner can add new patient, edit patient and delete patient.

  Background:
    This section runs before every Scenario. Its main purpose is to generate random user data
    and save it under provided key in scenario cache.

  Given I save "https://api.staging.whatsdoc.com" as "APP_URL"
  Given I save "application/json" as "CONTENT_TYPE_JSON"

  Scenario: Sign Up with incomplete name
    As application user
    I would like to signup new account with incomplete name

    Given I prepare new "POST" request to "{{.APP_URL}}/api/v1/sign_up_patient" and save it as "SIGNUP_REQUEST"
    Given I set following headers for prepared request "SIGNUP_REQUEST":
      """
      {
        "Content-Type": "{{.CONTENT_TYPE_JSON}}"
      }
      """
    Given I set following body for prepared request "SIGNUP_REQUEST":
      """
      {
        "user": {
            "name": "",
            "user_ic_number": "12345678",
            "user_phone": "+6551",
            "user_gender": "female",
            "user_date_of_birth": "23-01-1996",
            "email": "sella1@getnada.com",
            "type_user": "patient",
            "agree": "true",
            "fcm_token": "fgwut872ehnws2w1",
            "md_city_id": 3,
            "user_detail_attributes": {
			          "user_organization_code": ""
		        },
            "user_last_ip": "192.168.96.1",
            "user_phone_model": "",
            "user_os_version": "",
            "device_id": "",
            "user_agent": ""
	      }
      }
      """
    When I send request "SIGNUP_REQUEST"
    Then the response status code should not be 200
    But the response status code should be 400
    And the response body should have format "JSON"
    And the "JSON" node "response.message" should be "string" of value "Bad request"


  Scenario: Sign Up with blank phone number
    As application user
    I would like to signup new account with blank number

    Given I prepare new "POST" request to "{{.APP_URL}}/api/v1/sign_up_patient" and save it as "SIGNUP_REQUEST"
    Given I set following headers for prepared request "SIGNUP_REQUEST":
      """
      {
        "Content-Type": "{{.CONTENT_TYPE_JSON}}"
      }
      """
    Given I set following body for prepared request "SIGNUP_REQUEST":
      """
      {
        "user": {
            "name": "Sella 2",
            "user_ic_number": "12345678",
            "user_phone": "",
            "user_gender": "female",
            "user_date_of_birth": "23-01-1996",
            "email": "sella2@getnada.com",
            "type_user": "patient",
            "agree": "true",
            "fcm_token": "fgwut872ehnws2w2",
            "md_city_id": 3,
            "user_detail_attributes": {
			          "user_organization_code": ""
		        },
            "user_last_ip": "192.168.96.1",
            "user_phone_model": "",
            "user_os_version": "",
            "device_id": "",
            "user_agent": ""
	      }
      }
      """
    When I send request "SIGNUP_REQUEST"
    Then the response status code should not be 200
    But the response status code should be 400
    And the response body should have format "JSON"
    And the "JSON" node "response.message" should be "string" of value "Bad request"


  Scenario: Sign Up with incomplete phone number
      As application user
      I would like to signup new account with incomplete phone number

      Given I prepare new "POST" request to "{{.APP_URL}}/api/v1/sign_up_patient" and save it as "SIGNUP_REQUEST"
      Given I set following headers for prepared request "SIGNUP_REQUEST":
        """
        {
          "Content-Type": "{{.CONTENT_TYPE_JSON}}"
        }
        """
      Given I set following body for prepared request "SIGNUP_REQUEST":
        """
        {
          "user": {
              "name": "Sella 3",
              "user_ic_number": "12345678",
              "user_phone": "+65",
              "user_gender": "female",
              "user_date_of_birth": "23-01-1996",
              "email": "sella3@getnada.com",
              "type_user": "patient",
              "agree": "true",
              "fcm_token": "fgwut872ehnws2w3",
              "md_city_id": 3,
              "user_detail_attributes": {
                  "user_organization_code": ""
              },
              "user_last_ip": "192.168.96.1",
              "user_phone_model": "",
              "user_os_version": "",
              "device_id": "",
              "user_agent": ""
          }
        }
        """
      When I send request "SIGNUP_REQUEST"
      Then the response status code should not be 200
      But the response status code should be 400
      And the response body should have format "JSON"
      And the "JSON" node "response.message" should be "string" of value "Bad request"


  Scenario: Sign Up with existing phone number
      As application user
      I would like to signup new account with existing phone number

      Given I prepare new "POST" request to "{{.APP_URL}}/api/v1/sign_up_patient" and save it as "SIGNUP_REQUEST"
      Given I set following headers for prepared request "SIGNUP_REQUEST":
        """
        {
          "Content-Type": "{{.CONTENT_TYPE_JSON}}"
        }
        """
      Given I set following body for prepared request "SIGNUP_REQUEST":
        """
        {
          "user": {
              "name": "Sella 4",
              "user_ic_number": "12345678",
              "user_phone": "+65409",
              "user_gender": "female",
              "user_date_of_birth": "23-01-1996",
              "email": "sella4@getnada.com",
              "type_user": "patient",
              "agree": "true",
              "fcm_token": "fgwut872ehnws2w4",
              "md_city_id": 3,
              "user_detail_attributes": {
                  "user_organization_code": ""
              },
              "user_last_ip": "192.168.96.1",
              "user_phone_model": "",
              "user_os_version": "",
              "device_id": "",
              "user_agent": ""
          }
        }
        """
      When I send request "SIGNUP_REQUEST"
      Then the response status code should not be 200
      But the response status code should be 400
      And the response body should have format "JSON"
      And the "JSON" node "response.message" should be "string" of value "Bad request"  


  Scenario: Sign Up with blank email
    As application user
    I would like to signup new account with blank email

    Given I prepare new "POST" request to "{{.APP_URL}}/api/v1/sign_up_patient" and save it as "SIGNUP_REQUEST"
    Given I set following headers for prepared request "SIGNUP_REQUEST":
      """
      {
        "Content-Type": "{{.CONTENT_TYPE_JSON}}"
      }
      """
    Given I set following body for prepared request "SIGNUP_REQUEST":
      """
      {
        "user": {
            "name": "Sella 5",
            "user_ic_number": "12345678",
            "user_phone": "+6555",
            "user_gender": "female",
            "user_date_of_birth": "23-01-1996",
            "email": "",
            "type_user": "patient",
            "agree": "true",
            "fcm_token": "fgwut872ehnws2w5",
            "md_city_id": 3,
            "user_detail_attributes": {
			          "user_organization_code": ""
		        },
            "user_last_ip": "192.168.96.1",
            "user_phone_model": "",
            "user_os_version": "",
            "device_id": "",
            "user_agent": ""
	      }
      }
      """
    When I send request "SIGNUP_REQUEST"
    Then the response status code should not be 200
    But the response status code should be 400
    And the response body should have format "JSON"
    And the "JSON" node "response.message" should be "string" of value "Bad request"


  Scenario: Sign Up with invalid email
    As application user
    I would like to signup new account with invalid email

    Given I prepare new "POST" request to "{{.APP_URL}}/api/v1/sign_up_patient" and save it as "SIGNUP_REQUEST"
    Given I set following headers for prepared request "SIGNUP_REQUEST":
      """
      {
        "Content-Type": "{{.CONTENT_TYPE_JSON}}"
      }
      """
    Given I set following body for prepared request "SIGNUP_REQUEST":
      """
      {
        "user": {
            "name": "Sella 6",
            "user_ic_number": "12345678",
            "user_phone": "+6556",
            "user_gender": "female",
            "user_date_of_birth": "23-01-1996",
            "email": "sella6@getnadacom",
            "type_user": "patient",
            "agree": "true",
            "fcm_token": "fgwut872ehnws2w6",
            "md_city_id": 3,
            "user_detail_attributes": {
			          "user_organization_code": ""
		        },
            "user_last_ip": "192.168.96.1",
            "user_phone_model": "",
            "user_os_version": "",
            "device_id": "",
            "user_agent": ""
	      }
      }
      """
    When I send request "SIGNUP_REQUEST"
    Then the response status code should not be 200
    But the response status code should be 400
    And the response body should have format "JSON"
    And the "JSON" node "response.message" should be "string" of value "Bad request"


  Scenario: Sign Up with existing email
    As application user
    I would like to signup new account with existing email

    Given I prepare new "POST" request to "{{.APP_URL}}/api/v1/sign_up_patient" and save it as "SIGNUP_REQUEST"
    Given I set following headers for prepared request "SIGNUP_REQUEST":
      """
      {
        "Content-Type": "{{.CONTENT_TYPE_JSON}}"
      }
      """
    Given I set following body for prepared request "SIGNUP_REQUEST":
      """
      {
        "user": {
            "name": "Sella 7",
            "user_ic_number": "12345678",
            "user_phone": "+6557",
            "user_gender": "female",
            "user_date_of_birth": "23-01-1996",
            "email": "hjk@gmail.com",
            "type_user": "patient",
            "agree": "true",
            "fcm_token": "fgwut872ehnws2w7",
            "md_city_id": 3,
            "user_detail_attributes": {
			          "user_organization_code": ""
		        },
            "user_last_ip": "192.168.96.1",
            "user_phone_model": "",
            "user_os_version": "",
            "device_id": "",
            "user_agent": ""
	      }
      }
      """
    When I send request "SIGNUP_REQUEST"
    Then the response status code should not be 200
    But the response status code should be 400
    And the response body should have format "JSON"
    And the "JSON" node "response.message" should be "string" of value "Bad request"


  Scenario: Sign Up with false agreement
      As application user
      I would like to signup new account with false agreement

      Given I prepare new "POST" request to "{{.APP_URL}}/api/v1/sign_up_patient" and save it as "SIGNUP_REQUEST"
      Given I set following headers for prepared request "SIGNUP_REQUEST":
        """
        {
          "Content-Type": "{{.CONTENT_TYPE_JSON}}"
        }
        """
      Given I set following body for prepared request "SIGNUP_REQUEST":
        """
        {
          "user": {
              "name": "Sella 8",
              "user_ic_number": "12345678",
              "user_phone": "+6558",
              "user_gender": "female",
              "user_date_of_birth": "23-01-1996",
              "email": "sella8@getnada.com",
              "type_user": "patient",
              "agree": "false",
              "fcm_token": "fgwut872ehnws2w8",
              "md_city_id": 3,
              "user_detail_attributes": {
                  "user_organization_code": ""
              },
              "user_last_ip": "192.168.96.1",
              "user_phone_model": "",
              "user_os_version": "",
              "device_id": "",
              "user_agent": ""
          }
        }
        """
      When I send request "SIGNUP_REQUEST"
      Then the response status code should not be 200
      But the response status code should be 400
      And the response body should have format "JSON"
      And the "JSON" node "response.message" should be "string" of value "Bad request"


  Scenario: Sign Up with complete data
    As application user
    I would like to signup new account with complete data

    Given I prepare new "POST" request to "{{.APP_URL}}/api/v1/sign_up_patient" and save it as "SIGNUP_REQUEST"
    Given I set following headers for prepared request "SIGNUP_REQUEST":
      """
      {
        "Content-Type": "{{.CONTENT_TYPE_JSON}}"
      }
      """
    Given I set following body for prepared request "SIGNUP_REQUEST":
      """
      {
        "user": {
            "name": "Sella 9",
            "user_ic_number": "12345678",
            "user_phone": "+6559",
            "user_gender": "female",
            "user_date_of_birth": "23-01-1996",
            "email": "sella9p@getnada.com",
            "type_user": "patient",
            "agree": "true",
            "fcm_token": "fgwut872ehnws2w9",
            "md_city_id": 3,
            "user_detail_attributes": {
			          "user_organization_code": ""
		        },
            "user_last_ip": "192.168.96.1",
            "user_phone_model": "",
            "user_os_version": "",
            "device_id": "",
            "user_agent": ""
	      }
      }
      """
    When I send request "SIGNUP_REQUEST"
    Then the response status code should not be 400
    But the response status code should be 200
    And the response body should have format "JSON"
    And the "JSON" node "response.message" should be "string" of value "OK"