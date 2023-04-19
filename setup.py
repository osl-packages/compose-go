from setuptools import setup, find_packages

setup(
    name="compose-go",
    version="0.1.0", # changed by semantic-release
    author="Luã Bida Vacaro",
    author_email="luabidaa@gmail.com",
    description="Docker Compose v2 (GoLang) wrapped in a Python Package",
    packages=find_packages("src"),
    package_dir={"": "src"},
    license='BSD',
    install_requires=[],
)
