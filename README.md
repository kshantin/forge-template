# Forge Template

A template for quickly getting started with forge

## Getting Started

```
mkdir my-project
cd my-project
forge init --template https://github.com/KirillShantin/forge-template
git submodule update --init --recursive  ## initialize submodule dependencies
yarn install ## install development dependencies
forge build
forge test
```

## Features

### Testing Utilities

Includes a `Utilities.sol` contract with common testing methods (like creating users with an initial balance), as well as various other utility contracts.

### Preinstalled dependencies

`ds-test` for testing, `forge-std` for better cheatcode UX, and `solmate` for optimized contract implementations.  

### Linting

Pre-configured `solhint` and `prettier-plugin-solidity`. Can be run by

```
yarn solhint
yarn prettier
```
