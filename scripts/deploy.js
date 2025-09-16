const hre = require("hardhat");
const { ethers } = require("ethers");
require("dotenv").config();

async function main() {
  console.log("Network:", hre.network.name);

  // Provider & wallet
  const provider = new ethers.providers.JsonRpcProvider(process.env.GALILEO_RPC);
  const wallet = new ethers.Wallet(process.env.PRIVATE_KEY, provider);

  console.log("Deploying with account:", wallet.address);

  const balance = await provider.getBalance(wallet.address);
  console.log("Account balance:", ethers.utils.formatEther(balance), "OG");

  if (balance < ethers.utils.parseEther("0.01")) {
    console.warn("⚠️  Saldo sangat kecil, mungkin gagal deploy. Isi faucet dulu.");
  }

  // Deploy contract
  const SimpleStorage = await hre.ethers.getContractFactory("SimpleStorage", wallet);
  const simple = await SimpleStorage.deploy();
  await simple.deployed();

  console.log("✅ SimpleStorage deployed to:", simple.address);
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
