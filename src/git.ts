import { $, cd, chalk } from "zx";
import { BuildConfig } from "./types.js";
import { handleZxError, isDir } from "./utils.js";

export async function cloneRepo(
  { repoUrl, repoDir }: BuildConfig,
  recursive: boolean
) {
  console.log(chalk.blue(`Fetching repo from ${repoUrl} into ${repoDir}`));
  try {
    const directoryAlreadyExists = await isDir(repoDir);
    if (directoryAlreadyExists) {
      console.log(chalk.blue(`Repo already exists! Not cloning repo`));
      return;
    }
    const flags = [recursive ? "--recursive" : "", repoUrl, repoDir];
    await $`git clone ${flags}`;
  } catch (error: unknown) {
    console.error(chalk.red(`Could not clone repo ${repoUrl} to ${repoDir}`));
    handleZxError(error);
  }
}

export async function updateRepo({ repoUrl, repoDir }: BuildConfig) {
  console.log(chalk.blue(`Pulling latest in ${repoDir}`));
  cd(repoDir);
  try {
    await $`git fetch origin`;
  } catch (error: unknown) {
    console.error(
      chalk.red(`Could not fetch latest from ${repoUrl} in ${repoDir}`)
    );
    handleZxError(error);
  }
}

export async function gitCheckoutTag({ tag, repoDir }: BuildConfig) {
  console.log(chalk.blue(`Checking out "${tag}"`));
  cd(repoDir);
  await $`git checkout tags/${tag}`;
}
