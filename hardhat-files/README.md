# BuyMeACoffe-Dapp

# scripts/buy-coffee.js

Use this script for deploy and test the contract in local:

npx hardhat run scripts/buy-coffee.js

There are some utility functions defined at the top for convenience to do things like getting wallet balances and printing them out.
The main logic of the script is inside the main() function.
By running the scripts we get:

BuyMeACoffee deployed to: 0x5FbDB2315678afecb367f032d93F642f64180aa3
== start ==
Address 0 balance:  9999.99877079875
Address 1 balance:  10000.0
Address 2 balance:  0.0
== bought coffee ==
Address 0 balance:  9999.99877079875
Address 1 balance:  9998.999752902771922812
Address 2 balance:  3.0
== withdrawTips ==
Address 0 balance:  10002.998724900386770604
Address 1 balance:  9998.999752902771922812
Address 2 balance:  0.0
== memos ==
At 1652798836, Carolina (0x70997970C51812dc3A010C7d01b50e0d17dc79C8) said: "You're the best!"
At 1652798837, Vitto (0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC) said: "Amazing teacher"
At 1652798838, Kay (0x90F79bf6EB2c4f870365E785982E1f101E93b906) said: "I love my Proof of Knowledge"

At the start of the script (right after contract deploy), note that the 0 address has 9999.99877086625 ETH. This is because it started with 10k ETH as one of the pre-populated hardhat addresses, but it had to spend a tiny amount to deploy to the local blockchain.

In the second step == bought coffee ==, Address 1 purchases one coffee. Two other wallets that are not shown ALSO purchase coffees. In total, 3 coffees were purchased for a total tip amount of 3.0 ETH. You can see that Address 2 (which represents the contract address), is holding on to 3.0 ETH.

After the withdrawTips() function is called in == withdrawTips ==, the contract goes back down to 0 ETH, and the original deployer, aka Address 0, has now earned some money and is sitting on 10002.998724967892122376 ETH.

# scripts/deploy.js

This is super simple, just for deploying our contract to any network we choose later (We will choose Goerli)

npx hardhat run scripts/deploy.js --network goerli

# scripts/withdraw.js
Once you have a contract deployed to Goerli testnet, grab the contract address and update the contractAddress variable in scripts/withdraw.js, then:

npx hardhat run scripts/withdraw.js

will allow you to withdraw any tips stored on the contract.
Note that we didn't add the --network goerli flag this time, and that's because our script hard-codes the network configuration directly inside the scripts.