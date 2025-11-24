#####################
# Testing functions #
#####################
# PyTest runs all function in test files beginning with `test_`
# Results of tests are the output of assert calls
import pytest
import to_test

def test_add():
    # Arrange
    expected = 5
    # Act
    result = to_test.add(2, 3)
    # Assert
    assert result == expected

def test_divide():
    # Arrange
    expected = 2
    # Act
    result = to_test.divide(10, 5)
    # Assert
    assert result == expected

def test_divide_zero():
    # Arrange
    expected = ZeroDivisionError
    # Assert
    with pytest.raises(expected):
        # Act
        to_test.divide(10, 0)
