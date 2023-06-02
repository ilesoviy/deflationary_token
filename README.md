# Deflationary token

This GitHub repository contains a smart contract for a deflationary token built using Solidity and Hardhat. The smart contract is designed to implement a token with a deflationary mechanism, where a portion of the tokens are burned with each transaction, leading to a decrease in the total supply of the token over time.

The smart contract is built using Solidity, a programming language specifically designed for building smart contracts on the Ethereum blockchain. Hardhat is used as the development environment for the project, providing a powerful and flexible toolset for building and testing smart contracts.

The deflationary mechanism is implemented through a "burn" function, which is called with each transaction. The burn function calculates a percentage of the tokens based on the transaction amount and burns them, removing them from circulation and reducing the total supply of the token.

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.ts
```
