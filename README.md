# Reverse Dutch Auction Swap

Most swaps execute at the best available price instantly. In this challenge, you will flip traditional swaps on their head by implementing a Reverse Dutch Auction Swap where the price starts high and decreases over time until a buyer accepts.

## 📌 Task Breakdown:

1. Smart Contract (Solidity)
  - Build a Reverse Dutch Auction Swap Contract where:
    - ✅ A seller lists tokens for sale with:
        - Initial high price.
        - Time duration for the auction.
        - Price decrease rate per second.
  
    - ✅ A buyer can purchase at the current price, which decreases over time.
  
    - ✅ When a buyer accepts, the swap finalizes at the current price.

    - ✅ The contract should handle ERC20 token swaps.

2. Deployment & Scripts (Hardhat)

    Write deployment and interaction scripts that:

- ✅ Deploy the swap contract.
- ✅ Simulate a seller listing tokens.
- ✅ Execute the swap at different time intervals.

3. Writing Tests (Hardhat & Chai)
    Write tests for:
- ✅ Ensuring price decreases correctly over time.
- ✅ Ensuring only one buyer can purchase per auction.
- ✅ Ensuring funds and tokens are correctly swapped.
- ✅ Testing edge cases (e.g., no buyer before auction ends).

## Solution

Contract address: ``` 0xa742a466edEFCe37c65603Bd0a30489d628e4c0B ```

Token address: ``` 0x66646E89e971d7D14CF7af2247d6a3F2ee6A397a ```