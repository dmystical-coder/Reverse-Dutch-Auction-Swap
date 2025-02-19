const { expect } = require("chai");
const { ethers } = require("hardhat");
import {
    loadFixture
} from "@nomicfoundation/hardhat-toolbox/network-helpers";

describe("CompanyFundsManager", function () {

    async function deployDutchSwapFixture() {
        const [owner] = await ethers.getSigners();
        const DutchSwap = await ethers.getContractFactory("DutchSwap");
        const dutchSwap = await DutchSwap.deploy("0x66646E89e971d7D14CF7af2247d6a3F2ee6A397a");
        await dutchSwap.waitForDeployment();
        return { dutchSwap, owner };
    }

    describe("Deployment", () => {
        it("Should deploy the DutchSwap contract", async () => {
            const { dutchSwap } = await loadFixture(deployDutchSwapFixture);
            expect(await dutchSwap.token()).to.be.equal("0x66646E89e971d7D14CF7af2247d6a3F2ee6A397a");
        });
        
    })


    describe("", () => {
        
    })

    });
