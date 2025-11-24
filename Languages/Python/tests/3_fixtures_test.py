############
# Fixtures #
############
# Fixtures defines persistent objects without needing to define a class test for it's setup_method
import pytest
import to_test


@pytest.fixture
def rect1():
    return to_test.Rectangle(10, 20)

def test_rect_area(rect1):
    # Arrange
    expected = 200
    # Act
    result = rect1.area()
    # Assert
    assert result == expected

def test_rect_perimeter(rect2):
    # Arrange
    expected = 2 * (5 + 6)
    # Act
    result = rect2.perimeter()
    # Assert
    assert result == expected

