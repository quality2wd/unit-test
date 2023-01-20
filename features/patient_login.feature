Feature: Login Patient
  In The Manage patient Owner can add new patient, edit patient and delete patient.

  Background:
    This section runs before every Scenario. Its main purpose is to generate random user data
    and save it under provided key in scenario cache.

  Given I save "https://api.staging.whatsdoc.com" as "APP_URL"
  Given I save "application/json" as "CONTENT_TYPE_JSON"

  Scenario: Login with blank pin
    As application user
    I would like to login to my account with an blank pin

    Given I prepare new "POST" request to "{{.APP_URL}}/api/v1/sign_in_patient" and save it as "LOGIN_REQUEST"
    Given I set following headers for prepared request "LOGIN_REQUEST":
      """
      {
        "Content-Type": "{{.CONTENT_TYPE_JSON}}"
      }
      """
    Given I set following body for prepared request "LOGIN_REQUEST":
      """
      {
        "user_phone": "+6591",
        "user_pin": "",
        "app_version": "2.5.2",
        "user_last_ip": "192.168.96.21",
        "user_phone_model": "Xiaomi Poco X3",
        "user_os_version": "Android 11 Q",
        "device_id": "1103",
        "user_agent": "Mozilla/5.0 (Windows; U; Windows NT 4.0) AppleWebKit/534.49.2 (KHTML, like Gecko) Version/5.0.2 Safari/534.49.2",
        "fcm_token": "dZNkAMGWlSgxx9j9g"
      }
      """
    When I send request "LOGIN_REQUEST"
    Then the response status code should not be 200
    But the response status code should be 401
    And the response body should have format "JSON"
    And the "JSON" node "errors" should be "string" of value "Not Authenticated"


  Scenario: Login with invalid pin
    As application user
    I would like to login to my account with an invalid pin

    Given I prepare new "POST" request to "{{.APP_URL}}/api/v1/sign_in_patient" and save it as "LOGIN_REQUEST"
    Given I set following headers for prepared request "LOGIN_REQUEST":
      """
      {
        "Content-Type": "{{.CONTENT_TYPE_JSON}}"
      }
      """
    Given I set following body for prepared request "LOGIN_REQUEST":
      """
      {
        "user_phone": "+6591",
        "user_pin": "987322",
        "app_version": "2.5.2",
        "user_last_ip": "192.168.96.21",
        "user_phone_model": "Xiaomi Poco X3",
        "user_os_version": "Android 11 Q",
        "device_id": "1103",
        "user_agent": "Mozilla/5.0 (Windows; U; Windows NT 4.0) AppleWebKit/534.49.2 (KHTML, like Gecko) Version/5.0.2 Safari/534.49.2",
        "fcm_token": "dZNkAMGWlSgxx9j9g"
      }
      """
    When I send request "LOGIN_REQUEST"
    Then the response status code should not be 200
    But the response status code should be 401
    And the response body should have format "JSON"
    And the "JSON" node "errors" should be "string" of value "Not Authenticated"


  Scenario: Login with unregistered user
    As application user
    I would like to login to my account with an unregistered user

    Given I prepare new "POST" request to "{{.APP_URL}}/api/v1/sign_in_patient" and save it as "LOGIN_REQUEST"
    Given I set following headers for prepared request "LOGIN_REQUEST":
      """
      {
        "Content-Type": "{{.CONTENT_TYPE_JSON}}"
      }
      """
    Given I set following body for prepared request "LOGIN_REQUEST":
      """
      {
        "user_phone": "+659145",
        "user_pin": "123458",
        "app_version": "2.5.2",
        "user_last_ip": "192.168.96.21",
        "user_phone_model": "Xiaomi Poco X3",
        "user_os_version": "Android 11 Q",
        "device_id": "1103",
        "user_agent": "Mozilla/5.0 (Windows; U; Windows NT 4.0) AppleWebKit/534.49.2 (KHTML, like Gecko) Version/5.0.2 Safari/534.49.2",
        "fcm_token": "dZNkAMGWlSgxx9j9h"
      }
      """
    When I send request "LOGIN_REQUEST"
    Then the response status code should not be 200
    But the response status code should be 404
    And the response body should have format "JSON"
    And the "JSON" node "status" should be "string" of value "error"
    And the "JSON" node "message" should be "string" of value "User not found"

  
  Scenario: Login with incomplete phone number
    As application user
    I would like to login to my account with an incomplete phone number

    Given I prepare new "POST" request to "{{.APP_URL}}/api/v1/sign_in_patient" and save it as "LOGIN_REQUEST"
    Given I set following headers for prepared request "LOGIN_REQUEST":
      """
      {
        "Content-Type": "{{.CONTENT_TYPE_JSON}}"
      }
      """
    Given I set following body for prepared request "LOGIN_REQUEST":
      """
      {
        "user_phone": "+65",
        "user_pin": "123458",
        "app_version": "2.5.2",
        "user_last_ip": "192.168.96.21",
        "user_phone_model": "Xiaomi Poco X3",
        "user_os_version": "Android 11 Q",
        "device_id": "1103",
        "user_agent": "Mozilla/5.0 (Windows; U; Windows NT 4.0) AppleWebKit/534.49.2 (KHTML, like Gecko) Version/5.0.2 Safari/534.49.2",
        "fcm_token": "dZNkAMGWlSgxx9j9h"
      }
      """
    When I send request "LOGIN_REQUEST"
    Then the response status code should not be 200
    But the response status code should be 404
    And the response body should have format "JSON"
    And the "JSON" node "status" should be "string" of value "error"
    And the "JSON" node "message" should be "string" of value "User not found"


  Scenario: Login with blank phone number
    As application user
    I would like to login to my account with blank phone number

    Given I prepare new "POST" request to "{{.APP_URL}}/api/v1/sign_in_patient" and save it as "LOGIN_REQUEST"
    Given I set following headers for prepared request "LOGIN_REQUEST":
      """
      {
        "Content-Type": "{{.CONTENT_TYPE_JSON}}"
      }
      """
    Given I set following body for prepared request "LOGIN_REQUEST":
      """
      {
        "user_phone": "",
        "user_pin": "123458",
        "app_version": "2.5.2",
        "user_last_ip": "192.168.96.21",
        "user_phone_model": "Xiaomi Poco X3",
        "user_os_version": "Android 11 Q",
        "device_id": "1103",
        "user_agent": "Mozilla/5.0 (Windows; U; Windows NT 4.0) AppleWebKit/534.49.2 (KHTML, like Gecko) Version/5.0.2 Safari/534.49.2",
        "fcm_token": "dZNkAMGWlSgxx9j9h"
      }
      """
    When I send request "LOGIN_REQUEST"
    Then the response status code should not be 200
    But the response status code should be 404
    And the response body should have format "JSON"
    And the "JSON" node "status" should be "string" of value "error"
    And the "JSON" node "message" should be "string" of value "User not found"


  Scenario: Login with valid credentials
    As application user
    I would like to login to my account with a valid pin

    Given I prepare new "POST" request to "{{.APP_URL}}/api/v1/sign_in_patient" and save it as "LOGIN_REQUEST"
    Given I set following headers for prepared request "LOGIN_REQUEST":
      """
      {
        "Content-Type": "{{.CONTENT_TYPE_JSON}}"
      }
      """
    Given I set following body for prepared request "LOGIN_REQUEST":
      """
      {
        "user_phone": "+6591",
        "user_pin": "987321",
        "app_version": "2.5.2",
        "user_last_ip": "192.168.96.21",
        "user_phone_model": "Xiaomi Poco X3",
        "user_os_version": "Android 11 Q",
        "device_id": "1103",
        "user_agent": "Mozilla/5.0 (Windows; U; Windows NT 4.0) AppleWebKit/534.49.2 (KHTML, like Gecko) Version/5.0.2 Safari/534.49.2",
        "fcm_token": "dZNkAMGWlSgxx9j9g"
      }
      """
    When I send request "LOGIN_REQUEST"
    Then the response status code should not be 400
    But the response status code should be 200
    And the response body should have format "JSON"
    And the "JSON" node "data.auth_token" should be "string"
    And the "JSON" node "response.message" should be "string" of value "OK"
    And I save from the last response "JSON" node "data.auth_token" as "AUTH_TOKEN"
    And I save "{{.AUTH_TOKEN}}" as "AUTH_TOKEN"


  Scenario: Login with invalid user
    As application user
    I would like to login to my account with a valid pin

    Given I prepare new "POST" request to "{{.APP_URL}}/api/v1/sign_in_patient" and save it as "LOGIN_REQUEST"
    Given I set following headers for prepared request "LOGIN_REQUEST":
      """
      {
        "Content-Type": "{{.CONTENT_TYPE_JSON}}"
      }
      """
    Given I set following body for prepared request "LOGIN_REQUEST":
      """
      {
        "user_phone": "+65912345678",
        "user_pin": "987321",
        "app_version": "2.5.2",
        "user_last_ip": "192.168.96.21",
        "user_phone_model": "Xiaomi Poco X3",
        "user_os_version": "Android 11 Q",
        "device_id": "1103",
        "user_agent": "Mozilla/5.0 (Windows; U; Windows NT 4.0) AppleWebKit/534.49.2 (KHTML, like Gecko) Version/5.0.2 Safari/534.49.2",
        "fcm_token": "dZNkAMGWlSgxx9j9g"
      }
      """
    When I send request "LOGIN_REQUEST"
    Then the response status code should not be 200
    But the response status code should be 404
    And the response body should have format "JSON"
    And the "JSON" node "status" should be "string" of value "error"
    And the "JSON" node "message" should be "string" of value "user not found, please register first!"