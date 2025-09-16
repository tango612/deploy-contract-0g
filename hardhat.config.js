require("dotenv").config();
require("@nomiclabs/hardhat-ethers");

const GALILEO_RPC = process.env.GALILEO_RPC || "https://evmrpc-testnet.0g.ai";
const PRIVATE_KEY = process.env.PRIVATE_KEY || "";

module.exports = {
  solidity: "0.8.19",
  networks: {
    galileo: {
      url: GALILEO_RPC,
      chainId: 16601,
      accounts: PRIVATE_KEY ? [PRIVATE_KEY] : []
    }
  },
  etherscan: {
    // optional: config for verification if needed later
  }
};
