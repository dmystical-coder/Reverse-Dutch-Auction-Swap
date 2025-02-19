import {ethers} from 'hardhat';

const main = async () => {
    const [] = await ethers.getSigners();

    const tokenFactory = await ethers.getContractFactory("Token");
    console.log("Deploying Token Contract...");  
    const token = await tokenFactory.deploy(ethers.parseUnits('1000', 18));

    console.log("Token Contract deployed to:", token.target );
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
