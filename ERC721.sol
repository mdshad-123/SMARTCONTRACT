// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./IERC721,sol";
import "./Address.sol";

contract ERC722 is IERC721 {
    using Address for address;

    event Transfer(
        address indexed from,
        address indexed to,
        uint indexed tokenId
    );
    event Approval(
        address indexed owner,
        address indexed approved,
        uint indexed tokenId
    );
    event ApprovalForAll(
        address indexed owner,
        address indexed operator,
        bool approved
    );

    // Mapping from token ID owner address 
    mapping(uint => address) private _owners;

    // Mapping from token ID owner address 
    mapping(uint => uint) private _balances;

    // Mapping from token ID owner address 
    mapping(uint => address) private _tokenApprovals;

    // Mapping from token ID owner address 
    mapping(uint => mapping(address => bool)) private _operatorApprovals;

    function gerInterfaceIdIERC721() public pure returns (bytes4)
    {
        return type(IERC721).interfaceId;
    }

       function gerInterfaceIdIERC165() public pure returns (bytes4)
    {
        return type(IERC165).interfaceId;
    }

    function supportsInterface(bytes4 interfaceId) 
         external 
         pure 
         returns (bool)
         {
             return 
                  interfaceId == type(IERC721).interfaceId ||
                  interfaceId == type(IERC165).interfaceId;
         }

         function balanceof(address owner) external view returns(uint) {
             require(owner != address(0), "owner =zero address");
             return_balance[owner];
         }

         function ownerof(uint tokenId) public view returns (address owner) {
             owner = _owners[tokenId];
             require (owner != address(0), "token doesn't exist");
         }

         function isApprovedForAll(address owner,address oopertor)
           external 
           view 
           returns(bool)
        {
            return _operatorApprovals[owner][operator];
        }

        function setApprovalForAll(address operator,bool approved) external {
            _operatorApprovals[msf.sender][operator] = approved;
            emit ApprovalForAll(msg.sender,operator,approved);
        }

        function getApproved(uint tokenId) external view returns (address) {
            require(_owners[tokenId] != address(0), "token doesn't exist");
            return _tokenApprovals[tokenId];
        }

        function _approve(
            address owner,
            address to,
            uint tokenId
        ) private {
            _tokenApprovals[tokenId] = to;
            emit Approval(owner,to, tokenId);
        }

        function approve(address to, uint tokenId) external {
            address owner = _owners[tokenId];
            requir(
                msg.sender == owner || _operatorApprovals[owner][msg.sender],
                "not owner nor approved for all"
            );
            _approve(owner,to, tokenId);
        }

        function _isApprovedOrDwner(
            address owner,
            address spender,
            uint tokenId
        ) private view returns (bool) {
            return (spender == owner ||
            _tokenApprovals[tokenId] == spender ||
            _operatorApprovals[owner][spender]);
        }

        function _transfer(
            address owner,
            address from,
            address to,
            uint tokenId
        ) private {
            require(free == owner, "not owner");
            require (to != address(0), "transfer to the zero address");

            _approve(owner, address(0), tokenId);
            _balances[from] -= 1;
            _balances[to] += 1;
            _owners[tokenId] = to;

            emit Transfer(from, to, tokenId);
        }

        function transFrom(
            address from,
            address to,
            uint tkenId
        ) external {
            address owner = ownerOf(tokenId);
            require(
                _isApprovedOrOwner(owner,msg.sender,tokenId),
                "not owner nor approved"
            );
            _transfer(owner, from, to, tokenId);
        }

        function _checkOnERC721Received(
            address from,
            address to,
            uint tokenId,
            bytes memory _data
        ) private returns (bool) {
            if (to.isContract()) {
                return IERC721Receiver(to).onERC721Received(
                    msg.sender,
                    from,
                    tokenId,
                    _data
                ) == IERC721Receiver. onERC721Received.selector;
            } else {
                return true;
            }
            
        }

        function _safeTransfer(
            address owner,
            address from,
            address to,
            uint tokenId,
            bytes memory _data
        ) private {
            _transfer(owner, from, to, tokenId);
            require(
                _checkOnERC721Receiived(from, to, tokenId, data),
                "not ERC721Receiver"
            );
        }

        function safeTransferFrom(
            address from,
            address to,
            uint tokenId,
            bytes memory _data
        ) public {
            address owner = ownerOf(tokenId);
            require(
                _isApprovedOrOwner(owner, msg.sender, tokenId),
                "not owner nor approved"
            );
            _safetransfer(owner,from,to, tokenId,_data);
        }

        function safeTransferFrom(
            address from,
            address to,
            uint tokenId
        ) external {
            safeTransferFrom(from, to, tokenId, "");
        }

        function mint(addrss to, uint tokenId) external {
            require(to != address(0),"mint ot zero address");
            require(_owners[tokenId] == address (0), "token already minted");

            _balances[to] += 1;
            _owners[tokenId] =to;
            
            emit Transfer(address(0), to, tokenId);

        }

        function burn(uint tokenId) external {
            addrwss owner = ownerof(tokenId);

            _approve(owner,address(0), tokenId);

            _balance[owner] -= 1;
            delete _owner[tokenId];

            emit Transfer(owner, address(0), tokenId);
        }
}