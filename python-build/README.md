# python-build

*Docker container for building Python stuff in a CI fashion.*

I created this while evaluating Concourse CI as a CI/CD solution for our
Python stack at work.  It might be helpful for you as well so here it is.

## Usage
This container is a little strange in that it does not contain a ``CMD``.
It is meant to be run using ``docker run --rm -it`` with volumes mounted
appropriately and the command to run as an argument.  Various shell scripts
are included in the */app* directory.

**Simple Example**

This looks awful but remember that this is something that you should script
up and forget about.

```
docker run --rm -it -v $(pwd)/myproject:/source -v $(pwd)/output:/output \
   daveshawley/python-build /app/run-tests
```

### build-dist
Simply builds a wheel and source distribution in the output directory.

### build-docs
Builds sphinx documents for the project and puts the rendered HTML in the
output directory.

### run-tests
Runs nosetests with coverage enabled and writes the reports to the output
directory.

## Configuration
As you might expect, everything is configured using environment variables
that are described in this section.

### PYTHON\_BUILD\_SOURCE
**Where does the source code live on my disk?**  The default value is the
Docker volume `/source`.

### PYTHON\_BUILD\_OUTPUT
**Where should I place the output?**  The default value is the Docker volume
`/output`.

### PYTHON\_BUILD\_PYTHON
**Which Python interpreter should I use?**  The default value is
`python3`.

### PYTHON\_BUILD\_ADDITIONAL\_PACKAGES
**Any additional packages that you require?**  This isn't usually necessary
since we use *setup.py* for most things and automatically install the Pip
requirements files from *requirements.txt*, *test-requirements.txt*,
*requires/testing.txt*, and *requires/installation.txt*.  If you do find the
need to install additional packages and cannot modify the source, then use
this knob.  It is passed to ``pip install`` as-is.
