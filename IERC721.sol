// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IERC165 {
    function supportsIterface(bytes4 interfaceID) external view returns (bool);
}

interface IERC721 is IERC165 {
    function balanceof(address owner) external view returns (uint balance);

    function ownerof(uint tokenId) external view returns (address owner);

    function safeTransferFrom(
        address from,
        address to,
        uint tokenId
    )external;

    function safeTransferFrom(
        address from,
        address to,
        uint tokenId,
        bytes calldata data
    ) external;

     function transferFrom(
        address from,
        address to,
        uint tokenId
    )external;

    function approve(address to, uint tokenId) external;

    function gerApproved(uint tokenId) external view returns (address operator);

    function serApprovlaForAll(address operator, bool _approved) external;

    function isApprovedForAll(address owner, address operator)
        external 
        view 
        returns (bool);
}

interface IERC721Receiver {
    function onERC721Received(
        address operator,
        address from,
        uint tokenId,
        bytes calldata data
    ) external returns (bytes4);
}
