import { expect } from "chai";
import { ethers } from "hardhat";

describe("Rambling", function () {
  it("Test contract", async function () {
    const ContractFactory = await ethers.getContractFactory("Rambling");

    const instance = await ContractFactory.deploy();
    await instance.deployed();

    expect(await instance.name()).to.equal("Rambling");
  });
});
