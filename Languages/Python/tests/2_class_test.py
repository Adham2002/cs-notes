###################
# Testing classes #
###################
# Can group multiple tests into 1 class 
# setup_method is run when the class is initialized so can be used to create object once that can be used for all class tests
# teardown_method methods is run when all tests are done to clean up

import math
import to_test

class TestCircle:
    
    def setup_method(self, method):
        print(f"Setting up {method}")
        self.circle = to_test.Circle(10)
    
    def teardown_method(self, method):
        print(f"Tearing down {method}")
        del self.circle
    
    
    def test_area(self):
        # Arrange
        expected = math.pi * self.circle.radius ** 2
        # Act
        result = self.circle.area()
        # Assert
        assert result == expected

    def test_perimeter(self):
        # Arrange
        expected = math.pi * self.circle.radius * 2
        # Act
        result = self.circle.perimeter()
        # Assert
        assert result == expected
