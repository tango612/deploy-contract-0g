#!/bin/bash
set -e

echo "=== [1/5] Install dependencies ==="
npm install

echo "=== [2/5] Membuat contract SimpleStorage.sol ==="
mkdir -p contracts

cat > contracts/SimpleStorage.sol <<'EOF'
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {
    uint256 public value;

    event ValueSet(uint256 newValue);

    function set(uint256 _v) public {
        value = _v;
        emit ValueSet(_v);
    }

    function get() public view returns (uint256) {
        return value;
    }
}
EOF

echo "Kontrak dibuat di contracts/SimpleStorage.sol"

echo "=== [3/5] Compile contract ==="
npx hardhat clean
npx hardhat compile

echo "=== [4/5] Setup environment (.env) ==="
if [ ! -f .env ]; then
  echo "⚠️  File .env belum ada, membuat baru..."
  read -p "Masukkan Private Key (0x...): " PK
  read -p "Masukkan Galileo RPC [default: https://evmrpc-testnet.0g.ai]: " RPC
  RPC=${RPC:-https://evmrpc-testnet.0g.ai}

  cat > .env <<EOF
GALILEO_RPC=$RPC
PRIVATE_KEY=$PK
EOF

  echo ".env berhasil dibuat!"
else
  echo "File .env sudah ada, skip."
fi

echo "=== [5/5] Deploy ke Galileo testnet ==="
npx hardhat run scripts/deploy.js --network galileo
