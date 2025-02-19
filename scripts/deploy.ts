import {ethers} from 'hardhat';

const main = async () => {
    const [] = await ethers.getSigners();

    const dutchSwapFactory = await ethers.getContractFactory("DutchSwap");
    console.log("Deploying Dutch Swap Contract...");  
    const dutchSwap = await dutchSwapFactory.deploy();

    console.log("Dutch Swap Contract deployed to:", dutchSwap.target );
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
