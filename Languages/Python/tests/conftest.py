###############
# Config file #
###############
# `conftest.py` allows you to configure fixtures and settings that can be used in tests
import pytest
import to_test

# Fixtures configured in `conftest.py` file can then be used in any function pytest runs
@pytest.fixture
def rect1():
    return to_test.Rectangle(10, 20)

@pytest.fixture
def rect2():
    return to_test.Rectangle(5, 6)


# Register custom marker in `conftest.py` so they won't give warnings
def pytest_configure(config):
    config.addinivalue_line("markers", "slow: marks tests as slow (deselect with '-m \"not slow\"')")
    config.addinivalue_line("markers", "new(arg1, arg2): marks new")
