from setuptools import setup, find_packages
from os import path
from test_button import __title__, __author__, __version__

here = path.abspath(path.dirname(__file__))

# Get the long description from the README file
with open(path.join(here, "README.md"), encoding="utf-8") as f:
    long_description = f.read()

with open("requirements.txt") as reqs:
    requirements = reqs.read().splitlines()

setup(
    name=__title__,  # Required
    version=__version__,  # Required
    description="A test web app",  # Required
    long_description=long_description,  # Optional
    long_description_content_type="text/markdown",  # Optional (see note above)
    url="",  # Optional
    author=__author__,  # Optional
    author_email="",  # Optional
    classifiers=[],  # Optional
    keywords="setuptools development",  # Optional
    # Required
    packages=find_packages(exclude=["tests"]),
    install_requires=requirements,
    package_data={
        "": ["static/*"]
    },
    include_pacakage_data=True,
    extras_require={"test": ["coverage", "pytest", "pytest-cov", "coveralls", "tox"]},  # Optional
    entry_points={  # Optional
        "console_scripts": [
            "test-button=test_button.server:main",
        ],
    },
    project_urls={  # Optional
        "Source": "",
    },
)
