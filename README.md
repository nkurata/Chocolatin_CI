# Chocolatine

## Overview
Chocolatine is a GitHub Actions workflow designed to automate various aspects of your development process, including coding style checks, program compilation, and running tests. It also supports repository mirroring to a specified URL.

## Triggering Events
The workflow triggers on the following events:
- `push` to any branch except those matching the pattern `ga-ignore-**`
- `pull_request` to any branch except those matching the pattern `ga-ignore-**`

## Environment Variables
The workflow defines the following environment variables:
- `EXECUTABLES`: Specifies the executables to check after compilation (`"choco"`).
- `MIRROR_URL`: Specifies the URL for repository mirroring (`"git@github.com:nkurata/chocolate_rain.git"`).

## Jobs

### Check Coding Styles
**Name**: Check coding styles  
**Runs-on**: `ubuntu-latest`  
**Container**: `ghcr.io/epitech/coding-style-checker:latest`

**Steps**:
1. **Checkout Repository**: Uses the `actions/checkout@v3` action to checkout the code.
2. **Run Coding Style Check**: Executes a script to check coding styles. If the `coding-style-reports.log` file exists and is not empty, errors are logged and the job fails.

### Check Program Compilation
**Name**: Check program compilation  
**Runs-on**: `ubuntu-latest`  
**Container**: `epitechcontent/epitest-docker`

**Steps**:
1. **Checkout Repository**: Uses the `actions/checkout@v3` action to checkout the code.
2. **Compile Program**: Runs `make` to compile the program, with a timeout of 2 minutes.
3. **Clean Build Artifacts**: Runs `make clean` to clean up the build artifacts.
4. **Check Executables**: Verifies that the specified executables (`choco`) are present and executable. If not, the job fails with an exit code of 84.

### Run Tests
**Name**: Run tests  
**Runs-on**: `ubuntu-latest`  
**Container**: `epitechcontent/epitest-docker`

**Steps**:
1. **Checkout Repository**: Uses the `actions/checkout@v3` action to checkout the code.
2. **Run Tests**: Executes `make tests_run` to run the tests, with a timeout of 2 minutes.
3. **Clean Build Artifacts**: Runs `make clean` to clean up the build artifacts.
4. **Check Test Results**: Ensures that the test results file (`tests/units.xml`) exists and is not empty. If the file is missing or empty, the job fails with an exit code of 84.

### Mirroring
**Name**: Mirroring  
**Runs-on**: `ubuntu-latest`

**Steps**:
1. **Checkout Repository**: Uses the `actions/checkout@v3` action to checkout the code with full history (`fetch-depth: 0`).
2. **Mirror Repository**: Uses the `pixta-dev/repository-mirroring-action@v1` action to mirror the repository to the specified `MIRROR_URL`, using an SSH private key stored in the GitHub secrets (`GIT_SECRET`).

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request for any enhancements or fixes.
