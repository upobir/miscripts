import fs from 'fs';
import { ethers } from 'ethers';

function parseAbiFile(filePath: string): any {
  try {
    const fileContent = fs.readFileSync(filePath, 'utf-8');
    const jsonObject = JSON.parse(fileContent);
    return new ethers.utils.Interface(jsonObject.abi);
  } catch (error) {
    console.error('Error parsing JSON file:', error);
    return null;
  }
}

async function main(args: Array<string>) {
  if (args.length == 2) {
    console.log('usage: tsx human-redable-events.ts <path-to-json-abi>');
    console.log();
    return;
  }

  const abi = parseAbiFile(args[2]);
  if (abi === null) return;

  const signatures = abi.format(ethers.utils.FormatTypes.full) as Array<string>;

  for (const signature of signatures) {
    if (signature.startsWith('event')) {
      console.log(signature);
    }
  }
}
main(process.argv);
