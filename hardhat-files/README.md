## BuyMeACoffe-Dapp

### scripts/buy-coffee.js

Use this script for deploy and test the contract in local:

npx hardhat run scripts/buy-coffee.js

### scripts/deploy.js

This is super simple, just for deploying our contract to any network we choose later (We will choose Goerli):

npx hardhat run scripts/deploy.js --network goerli

### scripts/withdraw.js
Once you have a contract deployed to Goerli testnet, grab the contract address and update the contractAddress variable in scripts/withdraw.js, then:

npx hardhat run scripts/withdraw.js

will allow you to withdraw any tips stored on the contract.

Note that we didn't add the --network goerli flag this time, and that's because our script hard-codes the network configuration directly inside the scripts.
