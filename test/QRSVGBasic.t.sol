// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

import "forge-std/Test.sol";
import { QRSVG } from "../src/libraries/QRSVG.sol";
import "forge-std/console.sol";

contract QRSVGBasicTest is Test {
    string url = "https://link3.to/cyberconnect";

    function testGenerateQR() public {
        string memory code = QRSVG.generateQRCode(url);
        assertEq(
            code,
            "data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwLjUgMjkgMjkiPjxwYXRoIGQ9Ik0wLDFsNywwIE05LDFsMSwwIE0xMiwxbDIsMCBNMTUsMWwyLDAgTTE4LDFsMywwIE0yMiwxbDcsMCBNMCwybDEsMCBNNiwybDEsMCBNOCwybDIsMCBNMTIsMmwzLDAgTTE3LDJsMiwwIE0yMiwybDEsMCBNMjgsMmwxLDAgTTAsM2wxLDAgTTIsM2wzLDAgTTYsM2wxLDAgTTksM2wxLDAgTTEyLDNsMiwwIE0xNiwzbDEsMCBNMTksM2wxLDAgTTIyLDNsMSwwIE0yNCwzbDMsMCBNMjgsM2wxLDAgTTAsNGwxLDAgTTIsNGwzLDAgTTYsNGwxLDAgTTgsNGwyLDAgTTEyLDRsMSwwIE0xNCw0bDEsMCBNMTcsNGwxLDAgTTIwLDRsMSwwIE0yMiw0bDEsMCBNMjQsNGwzLDAgTTI4LDRsMSwwIE0wLDVsMSwwIE0yLDVsMywwIE02LDVsMSwwIE05LDVsMSwwIE0xMiw1bDIsMCBNMTUsNWw2LDAgTTIyLDVsMSwwIE0yNCw1bDMsMCBNMjgsNWwxLDAgTTAsNmwxLDAgTTYsNmwxLDAgTTgsNmwyLDAgTTEyLDZsMywwIE0xNyw2bDEsMCBNMjAsNmwxLDAgTTIyLDZsMSwwIE0yOCw2bDEsMCBNMCw3bDcsMCBNOCw3bDEsMCBNMTAsN2wxLDAgTTEyLDdsMSwwIE0xNCw3bDEsMCBNMTYsN2wxLDAgTTE4LDdsMSwwIE0yMCw3bDEsMCBNMjIsN2w3LDAgTTksOGwxLDAgTTEyLDhsMiwwIE0xNiw4bDEsMCBNMjAsOGwxLDAgTTAsOWw1LDAgTTYsOWw0LDAgTTEyLDlsMSwwIE0xNCw5bDEsMCBNMTcsOWwxLDAgTTIxLDlsMSwwIE0yMyw5bDEsMCBNMjUsOWwxLDAgTTI3LDlsMSwwIE00LDEwbDEsMCBNOCwxMGwyLDAgTTEyLDEwbDIsMCBNMTUsMTBsNiwwIE0yMiwxMGwxLDAgTTI0LDEwbDEsMCBNMjgsMTBsMSwwIE00LDExbDEsMCBNNiwxMWwyLDAgTTksMTFsMSwwIE0xMiwxMWwzLDAgTTE3LDExbDEsMCBNMjEsMTFsMSwwIE0yMywxMWwxLDAgTTAsMTJsMSwwIE0yLDEybDQsMCBNNywxMmwzLDAgTTEyLDEybDIsMCBNMTYsMTJsMSwwIE0xOCwxMmwyLDAgTTIyLDEybDEsMCBNMjUsMTJsMSwwIE0yNywxMmwxLDAgTTAsMTNsNSwwIE02LDEzbDEsMCBNOSwxM2wxLDAgTTEyLDEzbDEsMCBNMTQsMTNsMSwwIE0xNywxM2wxLDAgTTIxLDEzbDEsMCBNMjUsMTNsMiwwIE0wLDE0bDMsMCBNOSwxNGwxLDAgTTEyLDE0bDIsMCBNMTUsMTRsMTAsMCBNMjgsMTRsMSwwIE0wLDE1bDUsMCBNNiwxNWwyLDAgTTEyLDE1bDMsMCBNMTcsMTVsMSwwIE0yMCwxNWwxLDAgTTIyLDE1bDEsMCBNMjUsMTVsMiwwIE0zLDE2bDEsMCBNNSwxNmwxLDAgTTgsMTZsMiwwIE0xMiwxNmwyLDAgTTE2LDE2bDEsMCBNMTgsMTZsMSwwIE0yMSwxNmwzLDAgTTI3LDE2bDEsMCBNMSwxN2wxLDAgTTQsMTdsMSwwIE02LDE3bDEsMCBNOSwxN2wyLDAgTTEyLDE3bDEsMCBNMTQsMTdsMSwwIE0xNywxN2wxLDAgTTE5LDE3bDIsMCBNMjUsMTdsMiwwIE0xLDE4bDEsMCBNNywxOGw0LDAgTTEyLDE4bDIsMCBNMTUsMThsMiwwIE0xOCwxOGwzLDAgTTIyLDE4bDMsMCBNMjYsMThsMSwwIE0yOCwxOGwxLDAgTTIsMTlsMywwIE02LDE5bDEsMCBNOCwxOWwzLDAgTTEyLDE5bDMsMCBNMjAsMTlsMSwwIE0yMywxOWwyLDAgTTI2LDE5bDEsMCBNMiwyMGwxLDAgTTcsMjBsMiwwIE0xMiwyMGwyLDAgTTE2LDIwbDEsMCBNMTksMjBsMSwwIE0yMSwyMGwxLDAgTTI3LDIwbDEsMCBNMywyMWwxLDAgTTYsMjFsMSwwIE04LDIxbDEsMCBNMTIsMjFsMSwwIE0xNCwyMWwxLDAgTTE3LDIxbDEsMCBNMjAsMjFsNSwwIE0yNiwyMWwzLDAgTTgsMjJsMSwwIE0xMiwyMmwxLDAgTTE1LDIybDIsMCBNMTgsMjJsMSwwIE0yMCwyMmwxLDAgTTI0LDIybDUsMCBNMCwyM2w3LDAgTTgsMjNsMSwwIE0xMCwyM2wxLDAgTTEyLDIzbDEsMCBNMTcsMjNsNCwwIE0yMiwyM2wxLDAgTTI0LDIzbDMsMCBNMCwyNGwxLDAgTTYsMjRsMSwwIE0xMCwyNGwxLDAgTTEyLDI0bDEsMCBNMTQsMjRsMSwwIE0xNiwyNGwxLDAgTTE5LDI0bDIsMCBNMjQsMjRsMSwwIE0wLDI1bDEsMCBNMiwyNWwzLDAgTTYsMjVsMSwwIE04LDI1bDMsMCBNMTIsMjVsMSwwIE0xNywyNWwxLDAgTTIwLDI1bDUsMCBNMjYsMjVsMSwwIE0yOCwyNWwxLDAgTTAsMjZsMSwwIE0yLDI2bDMsMCBNNiwyNmwxLDAgTTgsMjZsMywwIE0xMiwyNmwxLDAgTTE0LDI2bDMsMCBNMTksMjZsMiwwIE0yNSwyNmwyLDAgTTAsMjdsMSwwIE0yLDI3bDMsMCBNNiwyN2wxLDAgTTgsMjdsMywwIE0xMiwyN2wxLDAgTTE5LDI3bDksMCBNMCwyOGwxLDAgTTYsMjhsMSwwIE04LDI4bDIsMCBNMTIsMjhsMSwwIE0xNiwyOGwxLDAgTTE4LDI4bDEsMCBNMjAsMjhsMSwwIE0yMiwyOGwxLDAgTTI0LDI4bDIsMCBNMjcsMjhsMSwwIE0wLDI5bDcsMCBNOCwyOWwxLDAgTTEyLDI5bDEsMCBNMTgsMjlsMSwwIE0yMiwyOWwyLDAgTTI2LDI5bDEsMCAiIHN0cm9rZT0id2hpdGUiIHN0cm9rZS13aWR0aD0iMSIgZmlsbD0ibm9uZSIvPjwvc3ZnPg=="
        );
    }

    function testInternalGeneralURI() public {
        QRSVG.QRMatrix memory m;
        string memory uri = QRSVG.generateQRURI(m);
        console.log(uri);
    }

    function testGenerateQRWeirdName() public {
        string memory handle = "https://link3.to/2isbq50_0q8eo_y90ccjv1gfs";
        string memory code = QRSVG.generateQRCode(handle);
        assertEq(
            code,
            "data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwLjUgMjkgMjkiPjxwYXRoIGQ9Ik0wLDFsNywwIE05LDFsMSwwIE0xMiwxbDIsMCBNMTYsMWwxLDAgTTE5LDFsMSwwIE0yMiwxbDcsMCBNMCwybDEsMCBNNiwybDEsMCBNOCwybDIsMCBNMTIsMmwyLDAgTTE1LDJsMiwwIE0yMCwybDEsMCBNMjIsMmwxLDAgTTI4LDJsMSwwIE0wLDNsMSwwIE0yLDNsMywwIE02LDNsMSwwIE05LDNsMSwwIE0xMiwzbDEsMCBNMjIsM2wxLDAgTTI0LDNsMywwIE0yOCwzbDEsMCBNMCw0bDEsMCBNMiw0bDMsMCBNNiw0bDEsMCBNOCw0bDIsMCBNMTIsNGw0LDAgTTE3LDRsMiwwIE0yMCw0bDEsMCBNMjIsNGwxLDAgTTI0LDRsMywwIE0yOCw0bDEsMCBNMCw1bDEsMCBNMiw1bDMsMCBNNiw1bDEsMCBNOSw1bDEsMCBNMTIsNWwxLDAgTTE0LDVsMSwwIE0xNiw1bDEsMCBNMTksNWwyLDAgTTIyLDVsMSwwIE0yNCw1bDMsMCBNMjgsNWwxLDAgTTAsNmwxLDAgTTYsNmwxLDAgTTgsNmwyLDAgTTEyLDZsNSwwIE0xOCw2bDEsMCBNMjIsNmwxLDAgTTI4LDZsMSwwIE0wLDdsNywwIE04LDdsMSwwIE0xMCw3bDEsMCBNMTIsN2wxLDAgTTE0LDdsMSwwIE0xNiw3bDEsMCBNMTgsN2wxLDAgTTIwLDdsMSwwIE0yMiw3bDcsMCBNOSw4bDEsMCBNMTIsOGwxLDAgTTE4LDhsMiwwIE0wLDlsNSwwIE02LDlsNCwwIE0xMiw5bDIsMCBNMTUsOWwxLDAgTTIxLDlsMSwwIE0yMyw5bDEsMCBNMjUsOWwxLDAgTTI3LDlsMSwwIE0wLDEwbDQsMCBNNywxMGwxLDAgTTksMTBsMSwwIE0xMiwxMGwxLDAgTTE0LDEwbDEsMCBNMTYsMTBsMiwwIE0xOSwxMGwyLDAgTTIyLDEwbDEsMCBNMjQsMTBsMSwwIE0yOCwxMGwxLDAgTTEsMTFsMSwwIE00LDExbDEsMCBNNiwxMWw0LDAgTTEyLDExbDEsMCBNMTUsMTFsMSwwIE0xNywxMWwxLDAgTTIwLDExbDIsMCBNMjMsMTFsMSwwIE0wLDEybDYsMCBNNywxMmwxLDAgTTksMTJsMSwwIE0xMiwxMmwxLDAgTTE0LDEybDIsMCBNMTksMTJsMSwwIE0yMiwxMmwxLDAgTTI1LDEybDEsMCBNMjcsMTJsMSwwIE0wLDEzbDIsMCBNNCwxM2w2LDAgTTEyLDEzbDcsMCBNMjAsMTNsMiwwIE0yNSwxM2wyLDAgTTAsMTRsMiwwIE01LDE0bDEsMCBNNywxNGwyLDAgTTEyLDE0bDEsMCBNMTksMTRsNiwwIE0yOCwxNGwxLDAgTTQsMTVsMywwIE04LDE1bDMsMCBNMTIsMTVsNSwwIE0xOCwxNWwxLDAgTTIwLDE1bDEsMCBNMjIsMTVsMSwwIE0yNSwxNWwyLDAgTTIsMTZsMSwwIE0xMiwxNmwxLDAgTTE0LDE2bDIsMCBNMTgsMTZsMSwwIE0yMSwxNmwzLDAgTTI3LDE2bDEsMCBNMCwxN2wzLDAgTTUsMTdsMiwwIE04LDE3bDEsMCBNMTIsMTdsMywwIE0xNiwxN2wyLDAgTTE5LDE3bDEsMCBNMjUsMTdsMiwwIE01LDE4bDEsMCBNNywxOGwyLDAgTTEyLDE4bDEsMCBNMTksMThsMiwwIE0yMiwxOGwzLDAgTTI2LDE4bDEsMCBNMjgsMThsMSwwIE0zLDE5bDIsMCBNNiwxOWwxLDAgTTksMTlsMiwwIE0xMiwxOWw1LDAgTTE4LDE5bDEsMCBNMjMsMTlsMiwwIE0yNiwxOWwxLDAgTTMsMjBsMiwwIE0xMCwyMGwxLDAgTTEyLDIwbDEsMCBNMTUsMjBsMSwwIE0xOSwyMGwxLDAgTTIxLDIwbDEsMCBNMjcsMjBsMSwwIE0yLDIxbDMsMCBNNiwyMWwyLDAgTTEyLDIxbDMsMCBNMTYsMjFsMywwIE0yMCwyMWw1LDAgTTI2LDIxbDMsMCBNOCwyMmwyLDAgTTEyLDIybDEsMCBNMTQsMjJsMSwwIE0xNiwyMmwyLDAgTTE5LDIybDIsMCBNMjQsMjJsNSwwIE0wLDIzbDcsMCBNOCwyM2wxLDAgTTEwLDIzbDEsMCBNMTIsMjNsMiwwIE0xNSwyM2wyLDAgTTE4LDIzbDMsMCBNMjIsMjNsMSwwIE0yNCwyM2wzLDAgTTAsMjRsMSwwIE02LDI0bDEsMCBNMTIsMjRsMSwwIE0xNCwyNGwxLDAgTTE2LDI0bDEsMCBNMTgsMjRsMSwwIE0yMCwyNGwxLDAgTTI0LDI0bDEsMCBNMjcsMjRsMiwwIE0wLDI1bDEsMCBNMiwyNWwzLDAgTTYsMjVsMSwwIE04LDI1bDEsMCBNMTAsMjVsMSwwIE0xMiwyNWwxLDAgTTE2LDI1bDIsMCBNMjAsMjVsNSwwIE0yNiwyNWwzLDAgTTAsMjZsMSwwIE0yLDI2bDMsMCBNNiwyNmwxLDAgTTgsMjZsMywwIE0xMiwyNmwxLDAgTTE1LDI2bDIsMCBNMTgsMjZsMywwIE0yNSwyNmw0LDAgTTAsMjdsMSwwIE0yLDI3bDMsMCBNNiwyN2wxLDAgTTgsMjdsMSwwIE0xMCwyN2wxLDAgTTEyLDI3bDEsMCBNMTUsMjdsMiwwIE0xOSwyN2w5LDAgTTAsMjhsMSwwIE02LDI4bDEsMCBNOCwyOGwxLDAgTTEwLDI4bDEsMCBNMTIsMjhsMSwwIE0xNiwyOGwxLDAgTTIwLDI4bDEsMCBNMjIsMjhsMSwwIE0yNCwyOGwyLDAgTTI3LDI4bDEsMCBNMCwyOWw3LDAgTTgsMjlsMywwIE0xMiwyOWwxLDAgTTE3LDI5bDEsMCBNMjIsMjlsMiwwIE0yNiwyOWwxLDAgIiBzdHJva2U9IndoaXRlIiBzdHJva2Utd2lkdGg9IjEiIGZpbGw9Im5vbmUiLz48L3N2Zz4="
        );
    }
}