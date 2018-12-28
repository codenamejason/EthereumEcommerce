# EthereumEcommerce
Ebay dApp in Ethereum

This dApp has a Vickery Auction for users to purchase products and then the product handling is done by Escrow contract

Technologies used : Ethereum, Truffle, Solidity, web3.js, Node.js

Smart Contracts : EcommerceStore.sol and Escrow.sol

# How Vikery Auction works
We have successfully added a product to the blockchain. Now, users should be able to bid on your product just like on eBay.

eBay has a few different types of auctions such as incremental bidding, automatic bidding etc. Below is an example showing how eBay's automatic bidding works:

Let's say a product is listed at $10. You can bid any amount greater than $10. 

1. Alice bids $10.50 for the product. So, she is the contender to win the auction.
2. Mary now sees the bid at $10.50 but she bids $15. Even though she bid $15, eBay shows the highest bid at $10.75. Also, Alice lost the bid but she can bid again.
3. John now sees the bid is $10.75 and he bids $12 but eBay bids on behalf of Mary (because she has bid $15) and ups the bid to $12.25 ($0.25 more than what John bid). So, John loses the bid.
4. Now Alice decides to bid $17. Since Alice's bid is higher than Mary's, eBay sets the bid price to $15.25 ($0.25 more than Mary's bid). Mary loses the bid (she can bid a higher amount if she likes).
5. No more bids are placed and so Alice wins. Even though Alice bid $17, she only has to pay $15.25.
