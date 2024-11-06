# Yavafetch

Yavafetch is a simple system information tool written in JavaScript. It is simply made to learn JavaScript as I wanted a simple project that is also kind of detailed and does not use any external libraries. It is inspired by neofetch/fastfetch/pfetch. It is written with as minimal as possible shellcode so I could truly get the terrible experience of JavaScript. It is also incredibly modular and easy to add new features to.

## Installation

```bash
npm install yavafetch -g
```

Boom now you have yavafetch installed on your system.

## Usage

Just run the command Yavafetch in your terminal and you will see the information about your system.

## Documentation

It is MIT licensed, and published on the NPM registry. You can find the source code on [GitHub](github.com/jeebuscrossaint/Yavafetch).

### index.js (main entry point)

We start off with a bunch of imports from the relative modules of the program. These modules are responsible for getting the information about the system and printing it to the console. They are the actual logic. The main entry point is responsible for calling these functions and printing the information to the console.

```javascript
const { printAsciiArt } = require('../modules/ascii');
const { printHelp } = require('../modules/help');
const { nameInfo } = require('../modules/nameInfo');
const { osName } = require('../modules/osName');
const { hostName } = require('../modules/host');
const { printOsSpecificAsciiArt } = require('../modules/specificAscii');
const { arch } = require('../modules/arch');
const { kernelVersion } = require('../modules/kernel');
const { getUptime } = require('../modules/uptime');
const { determineManager } = require('../modules/packageInfo');
const { cpuInfo } = require('../modules/cpuInfo');
const { memInfo } = require('../modules/memInfo');
const { swapInfo } = require('../modules/swapInfo');
const { getLocalIP } = require('../modules/network');
const { getGpuInfo } = require('../modules/gpuInfo');
const { getShellInfo } = require('../modules/shell');
const { getBatteryInfo } = require('../modules/battery');
const { listDisks } = require('../modules/disk');
```

Next in the index.js file we have the asynchronous defaultInfo function which is what executs if the user does not add any flags to the program. It is responsible for calling all the functions that get the system information and printing it to the console.

```javascript
async function defaultInfo() {
    printOsSpecificAsciiArt();
    const name = nameInfo();
    console.log(`\x1b[1m${name}\x1b[0m`);
    const os = osName();
    console.log(`\x1b[1mOS:\x1b[0m ${os}`);
    const host = hostName();
    console.log(`\x1b[1mHost:\x1b[0m ${host}`); 
    const architecture = arch();
    console.log(`\x1b[1mArchitecture:\x1b[0m ${architecture}`);
    const version = kernelVersion();
    console.log(`\x1b[1mKernel Version:\x1b[0m ${version}`);
    const up = getUptime();
    console.log(`\x1b[1mUptime:\x1b[0m ${up}`);
    const manager = determineManager();
    console.log(`\x1b[1mPackage Manager:\x1b[0m ${manager}`); // this only works on windows
    const cpu = cpuInfo();
    console.log(`\x1b[1mCPU:\x1b[0m ${cpu.slice(4)}`);
    const mem = memInfo();
    console.log(`\x1b[1mMemory:\x1b[0m ${mem}`);
    const swap = swapInfo();
    console.log(`\x1b[1mSwap:\x1b[0m ${swap}`);
    const ip = getLocalIP();
    console.log(`\x1b[1mLocal IP:\x1b[0m ${ip}`);
    const shell = getShellInfo();
    console.log(`\x1b[1mShell:\x1b[0m ${shell}`);
    const battery = await getBatteryInfo();
    console.log(`\x1b[1mBattery:\x1b[0m ${battery}`);
    const disk = listDisks();
    console.log(`${disk}`);
    const gpu = getGpuInfo();
    console.log(`${gpu}`);
}
```

The last part of the index.js file is the main function which is responsible for parsing the flags and calling the appropriate functions.

```javascript

async function main() {
    const flags = process.argv.slice(2);
    switch (true) {
        case flags.includes('--help'):
            printHelp();
            break;
        
        case flags.includes('--ascii'):
            printAsciiArt();
            await defaultInfo(); // Add await here
            break;
        default:
            await defaultInfo();
    }
}

main();
```
