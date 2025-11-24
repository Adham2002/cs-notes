import time
import pytest
import to_test

###########
# Markers #
###########
# Markers can change how certain tests are handled or just mark certain tests to help with documentation
# Built in markers like parametrize, skip and xfail each change how the test runs
# A custom marker like slow just tags that test for documentation
# We can also specify which tests to run based on markers in the command line `pytest -m "slow"` will only run tests marked as slow

# parametrize - perform multiple calls to the same test function
@pytest.mark.parametrize("side, expected", [(5, 25), (4, 16), (9, 81), (10, 100)])
def test_multiple_square_areas(side, expected):
    assert to_test.Square(side).area() == expected

# skip - always skip a test function
@pytest.mark.skip(reason = 'Feature currently not working yet')
def test2():
    assert False

# xfail - produce an “expected failure” outcome if a certain condition is met
@pytest.mark.xfail(reason = 'Feature failing on purpose')
def test3():
    assert False

# Custom markers - mostly for documentation and filtering (define these in `conftest.py` to avoid warnings)
@pytest.mark.slow
def test_very_slow():
    time.sleep(1)
    assert True


# Other common markers
# usefixtures - use fixtures on a test function or class
# filterwarnings - filter certain warnings of a test function
# skipif - skip a test function if a certain condition is met

