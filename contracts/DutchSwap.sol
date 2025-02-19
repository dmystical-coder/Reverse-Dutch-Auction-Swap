// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DutchSwap is Ownable {
    IERC20 public token;
    uint256 public initialPrice;
    uint256 public startTime;
    uint256 public duration;
    uint256 public priceDecreaseRate;
    bool public finalized;

    event TokensListed(
        address indexed seller,
        uint256 amount,
        uint256 initialPrice,
        uint256 duration,
        uint256 priceDecreaseRate
    );
    event SwapFinalized(
        address indexed buyer,
        uint256 amount,
        uint256 finalPrice
    );

    constructor(address _token) Ownable(msg.sender) {
        token = IERC20(_token);
    }

    function listTokens(
        uint256 amount,
        uint256 _initialPrice,
        uint256 _duration,
        uint256 _priceDecreaseRate
    ) external onlyOwner {
        require(amount > 0, "Amount must be greater than zero");
        require(_initialPrice > 0, "Initial price must be greater than zero");
        require(_duration > 0, "Duration must be greater than zero");
        require(
            _priceDecreaseRate > 0,
            "Price decrease rate must be greater than zero"
        );
        token.approve(address(this), amount);
        token.transferFrom(msg.sender, address(this), amount);

        initialPrice = _initialPrice;
        startTime = block.timestamp;
        duration = _duration;
        priceDecreaseRate = _priceDecreaseRate;
        finalized = false;

        emit TokensListed(
            msg.sender,
            amount,
            _initialPrice,
            _duration,
            _priceDecreaseRate
        );
    }

    function getCurrentPrice() public view returns (uint256) {
        if (block.timestamp >= startTime + duration) {
            return 0;
        }
        uint256 elapsedTime = block.timestamp - startTime;
        uint256 priceDecrease = elapsedTime * priceDecreaseRate;
        return initialPrice > priceDecrease ? initialPrice - priceDecrease : 0;
    }

    function buyTokens() external payable {
        require(!finalized, "Swap already finalized");
        uint256 currentPrice = getCurrentPrice();
        require(msg.value >= currentPrice, "Insufficient payment");

        uint256 amount = token.balanceOf(address(this));
        token.transfer(msg.sender, amount);
        payable(owner()).transfer(msg.value);

        finalized = true;

        emit SwapFinalized(msg.sender, amount, currentPrice);
    }
}
