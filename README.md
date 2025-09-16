# Deploy SimpleStorage to 0G Galileo (via GitHub Codespaces)

## Steps
1. Open this repository in **GitHub Codespaces**.
2. Create a `.env` file (copy from `.env.example`) or set environment variables in Codespaces:
   - `GALILEO_RPC` (default: https://evmrpc-testnet.0g.ai)
   - `PRIVATE_KEY` (0x...)
3. In terminal:
   - `npx hardhat compile`
   - `node scripts/deploy.js`  (atau `npx hardhat run scripts/deploy.js --network galileo`)

Faucet & test tokens: gunakan faucet 0G untuk isi OG test token. :contentReference[oaicite:2]{index=2}
