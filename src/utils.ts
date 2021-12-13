import { chalk, fs, path, question } from "zx";
import { BuildConfig, DirPath, FilePath, isProcessOutput } from "./types.js";

export async function isDir(pathToCheck: DirPath | string): Promise<boolean> {
  try {
    const stat = await fs.stat(pathToCheck);
    return stat.isDirectory();
  } catch {
    return false;
  }
}

export async function isFile(pathToCheck: FilePath | string): Promise<boolean> {
  try {
    const stat = await fs.stat(pathToCheck);
    return stat.isFile();
  } catch {
    return false;
  }
}

export function handleZxError(error: unknown): void {
  if (isProcessOutput(error)) {
    console.error(error.stderr);
  } else {
    console.error(error);
  }
}

export async function confirmConfigIsOk(
  buildConfig: BuildConfig
): Promise<boolean> {
  console.log("Building with this config", buildConfig);
  const answer = await question("Does this configuration look correct? ");
  if (!["Y", "y", "Yes", "yes"].includes(answer)) {
    console.log(chalk.blue("Ok, we'll not do anything. Bye!"));
    return false;
  }
  return true;
}

export function pathToGitRepo(name: string, workDir: DirPath): string {
  return path.normalize(`${workDir}/${name}`);
}
