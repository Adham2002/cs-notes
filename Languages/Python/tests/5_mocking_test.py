###########
# Mocking #
###########
# Useful when you write code that calls an API or database or other external system 
# Tests shouldn't depend on that system so we replaces external dependencies with controlled mocks
import requests
import unittest.mock as mock    # unit test is built-in package from python 3.3
import pytest
import to_test


# Mock decorator replaces calls to `to_test.get_user_from_db` with `mock_get_user_from_db.return_value`
@mock.patch('to_test.get_user_from_db')
def test_get_user_from_db(mock_get_user_from_db):
    # Arrange
    mock_get_user_from_db.return_value = "Mocked Alice"
    excepted = "Mocked Alice"
    # Act
    username = to_test.get_user_from_db((1))
    # Assert
    assert username == excepted


# Mock decorator replaces calls to `requests.get` with `mock_get.return_value`
# mock.Mock() is a mock object that imitates the structure/spec of the object returned by `requests.get`
@mock.patch('requests.get')
def test_get_user_from_api(mock_get):
    # Arrange
    mock_response = mock.Mock()
    mock_response.status_code = 200
    mock_response.good = 4
    mock_response.json.return_value = {'id': 1, 'name': 'mocked'}
    mock_get.return_value = mock_response
    excepted = {'id': 1, 'name': 'mocked'}
    # Act
    result = to_test.get_users_from_api()
    # Assert
    assert result == excepted


@mock.patch('requests.get')
def test_get_user_from_api_error(mock_get):
    # Arrange
    mock_response = mock.Mock()
    mock_response.status_code = 400
    mock_get.return_value = mock_response
    # Assert
    with pytest.raises(requests.HTTPError):
        to_test.get_users_from_api()
