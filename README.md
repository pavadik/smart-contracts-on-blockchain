# smart-contracts-on-blockchain
This is a simple implementation of an ERC-20 token, which includes the following:

constructor - function is called when the contract is deployed and sets the name, symbol, decimals, and total supply of the token. It also sets the initial balance of the contract deployer to the total supply.

transfer - function allows the contract owner to transfer tokens to another address. It checks that the sender has sufficient balance and emits a Transfer event.

approve - function allows the contract owner to allow another address to transfer tokens from their account. It sets the allowance for the spender and emits an Approval event.

transferFrom - function allows another address to transfer tokens from the contract owner's account using an allowance. It checks that the sender has sufficient balance and allowance and emits a Transfer event.

getBalance - function allows anyone to view the balance of a specific address.
