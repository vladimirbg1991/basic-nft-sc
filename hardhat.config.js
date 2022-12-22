require("@nomiclabs/hardhat-waffle")
require("dotenv").config()
require("@nomiclabs/hardhat-etherscan")
// require("@nomiclabs/hardhat-ethers")
require("hardhat-gas-reporter")
require("hardhat-deploy")

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  // defaultNetwork: "hardhat", // already comes with the pvt key and rpc url
  networks: {
    goerli: {
      url: process.env.GOERLI_RPC_URL || "",
      accounts: [process.env.PRIVATE_KEY], // instead we can use namedAccounts
      chainId: 5,
      blockConfirmations: 3,
    },
    localhost: {
      url: "http://127.0.0.1:8545/",
      chainId: 31337,
    },
  },
  namedAccounts: {
    deployer: {
      default: 0,
      31337: 0, // on diff chains
      5: 0,
    },
    user: {
      default: 1,
    },
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY || "",
  },
  gasReporter: {
    enabled: true,
    outputFile: "gas-report.txt",
    noColors: true,
    currency: "USD",
    // coinmarcetcap: process.env.COINMARCETCAP_API_KEY,
    // token: "MATIC",
  },
  // solidity: "0.8.4",
  solidity: {
    compilers: [{ version: "0.8.4" }, { version: "0.6.6" }],
  },
}
