#################
# Package Setup #
#################
'''
You can publish your package as a 3rd party package for public or private use, typically via PyPI
This required a setup.py file which contains configuration and metadata abt the package like name, version, author, dependencies, etc.
Steps to Create a Distributable Package
    1. Organize your code into a directory structure with an __init__.py file
    2. Create a setup.py file
    3. Use setuptools to create a distributable package by running 'python setup.py sdist bdist_wheel'
    4. Publish the Package to PyPI which will make it installable via pip
        a. Install twine to handle the publishing process
        b. Run 'twine upload dist/*'
'''


''' Example setup.py '''
from setuptools import setup, find_packages

setup(
    name="mypackage",
    version="0.1.0",
    packages=find_packages(),
    install_requires=["numpy", "pandas"],                   # dependencies
    author="Your Name",
    author_email="your.email@example.com",
    description="A sample Python package",
    url="https://github.com/yourusername/mypackage"
)
