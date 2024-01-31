## TP Blockchain Solution
//===============================================
### voting contract:

- The `vote()` function allows users to cast their votes for a singer.
- The `getVoteCount()` function enables each singer to check the total number of votes they received.
- The `addSinger()` function, accessible only by the owner, adds a new singer to the list of eligible candidates.


### deposit and withdraw contract:

**Requirement:** Ensure you install the OpenZeppelin Contracts package by running `npm install @openzeppelin/contracts` before deploying the contract.

- The contract accepts an ERC20 token as a parameter during deployment and stores it in the token variable.
- The `deposit` function allows users to transfer tokens to the contract, updating their balances accordingly.
- The `withdraw` function allows users to withdraw tokens if they have a sufficient balance, updating their balances accordingly.
