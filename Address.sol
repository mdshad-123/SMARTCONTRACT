// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.13;

// library Address {
//     function isContract(address account) internal view returns (bool) {
//         uint size;
//         assembly {
//             size := extcodesize(account)
//         }
//         return size > 0;
//     }
// }

library address {
    function isContract(address account) internal view returns (bool) {
        uint size;
        assembly {
            size := extcodestsize(account)
        }
        return size > 0;
    }
}
