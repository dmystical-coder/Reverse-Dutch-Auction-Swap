import {ethers} from 'hardhat';

const main = async () => {
    const [] = await ethers.getSigners();

    const dutchSwapFactory = await ethers.getContractFactory("DutchSwap");
    console.log("Deploying Dutch Swap Contract...");  
    const dutchSwap = await dutchSwapFactory.deploy("0x66646E89e971d7D14CF7af2247d6a3F2ee6A397a");

    console.log("Dutch Swap Contract deployed to:", dutchSwap.target );
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
