import { ethers } from "hardhat";

async function main() {
  const TokenFactory = await ethers.getContractFactory("DanilychToken");
  const token = await TokenFactory.deploy(3);

  await token.deployed();
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
