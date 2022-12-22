// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
error BasicNft__NotExistingToken();

contract BasicNft is ERC721 {
  string public constant TOKEN_URI_ONE =
    "ipfs://QmaVkBn2tKmjbhphU7eyztbvSQU5EXDdqRyXZtRhSGgJGo";
  string public constant TOKEN_URI_TWO =
    "ipfs://QmYQC5aGZu2PTH8XzbJrbDnvhj3gVs7ya33H9mqUNvST3d";
  string public constant TOKEN_URI_THREE =
    "ipfs://QmZYmH5iDbD6v3U2ixoVAjioSzvWJszDzYdbeCLquGSpVm";
  uint256 private s_tokenCounter;

  constructor() ERC721("fbNFTGallery", "FBNFT") {
    s_tokenCounter = 0;
  }

  function mintNft() public {
    s_tokenCounter = s_tokenCounter + 1;
    _safeMint(msg.sender, s_tokenCounter);
  }

  function tokenURI(
    uint256 tokenId
  ) public view override returns (string memory) {
    if (tokenId > s_tokenCounter) {
      revert BasicNft__NotExistingToken();
    }
    if (tokenId % 3 == 1) {
      return TOKEN_URI_ONE;
    } else if (tokenId % 3 == 2) {
      return TOKEN_URI_TWO;
    } else {
      return TOKEN_URI_THREE;
    }
  }

  function getTokenCounter() public view returns (uint256) {
    return s_tokenCounter;
  }
}
