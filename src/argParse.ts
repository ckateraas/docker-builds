import { argv, chalk, path } from "zx";
import type { BuildConfig, DirPath, FilePath } from "./types.js";
import { isFile } from "./utils.js";

async function validateDockerFile(
  workDir: string,
  input?: string
): Promise<FilePath> {
  if (!input && !!workDir) {
    input = path.join(workDir, "Dockerfile");
  }
  if (!input) {
    console.log(
      chalk.red(
        `You did not specify --dockerFile, so we don't know which Dockerfile to build.`
      ),
      input
    );
    throw new Error(`Unable to start. Missing --dockerFile argument`);
  }
  const dockerFileExists = await isFile(input);
  if (!dockerFileExists) {
    console.log(
      chalk.red(`We couldn't find the Dockerfile you asked us to use.`)
    );
    throw new Error(`--dockerFile=${input} does not exist`);
  }
  return input as FilePath;
}

async function validateRepoDir(
  workDir: string,
  input?: string
): Promise<DirPath> {
  if (!input || typeof input !== "string") {
    const defaultRepoDir = path.join(workDir, "repo");
    console.log(
      chalk.blue(`No --repoDir given. Defaulting to "${defaultRepoDir}"`)
    );
    return defaultRepoDir as DirPath;
  }
  return input as DirPath;
}

async function validateWorkDir(input?: any): Promise<DirPath> {
  if (!input || typeof input !== "string") {
    console.log(chalk.red(`You did not specify --workDir.`), input);
    throw new Error(`Unable to start. Missing --workDir argument`);
  }
  return input as DirPath;
}

function validateRepoUrl(input?: any): string {
  if (!input || typeof input !== "string") {
    console.log(
      chalk.red(
        `You did not specify --repoUrl, so we don't know which Git repo to clone.`
      ),
      input
    );
    throw new Error(`Unable to start. Missing --repoUrl argument`);
  }
  return input;
}

function validateTag(input?: any): string | undefined {
  if (!input || typeof input !== "string") {
    console.log(
      chalk.blue(
        `You did not specify --tag, so we'll build the latest commit on the repo's default branch.`
      ),
      input
    );
  }
  return input;
}

export async function parseArgs(): Promise<BuildConfig> {
  const workDir = await validateWorkDir(argv["workDir"]);
  const repoDir = await validateRepoDir(workDir, argv["repoDir"]);
  const repoUrl = validateRepoUrl(argv["repoUrl"]);
  const dockerFile = await validateDockerFile(workDir, argv["dockerFile"]);
  const tag = validateTag(argv["tag"]);
  return {
    repoUrl,
    workDir,
    repoDir,
    dockerFile,
    tag,
  };
}
