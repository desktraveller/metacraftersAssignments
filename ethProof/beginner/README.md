# BrickHeadCoin

A crypto token called brickHeadCoin. 

## Description

A really simple crypto token.

Users can check their brickHeadCoin balance.

Any user can create new tokens into another user account (or their own account).

Any user can destroy tokens even if they don't own them.

## Getting Started

the token can be compiled and deployed to an evm compatible blockchain in the remix ide.

the token can also be tested in the remix ide by deploying it to a testnet or to the remix vm.

### Installing

1. go to the remix ide website.

2. create a new file called "brickHeadCoin.sol" in the remix ide explorer.

3. copy and paste the code in this directory to the newly created file.

4. compile the code in the remix ide.

5. deploy it to the remix vm for testing.

6. you can also deploy to a real blockchain mainnet or testnet.

7. this requires connecting remix to metamask and requires that you have ethers to pay for gas fees.

### Executing program

functions in the contract:

tokenName - returns "brickHeadCoin"

tokenAbbrv - returns "BHC"

totalSupply - returns the circulating supply of BHC at any moment

balances - takes an address as input - returns the balance of that address

mint - creates new tokens

burn - destroys tokens

the mint and burn functions both take in the address to be minted to, and the amount to be minted as inputs

## Help

any user can destroy tokens (burn) even if they don't need them

this is a problem that needs to be resolved

any user can create tokens. this is another problem since the tokens will lack scarcity

this also needs to be resolved

## Authors

created by dextraveller


## License

This project is licensed under the MIT open source licence.