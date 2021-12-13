import { chalk, path, $ } from "zx";
import { BuildConfig } from "./types";

function builderImageName(name: string): string {
  return `${name}-builder`;
}

export async function buildImage(
  { dockerFile }: BuildConfig,
  name: string
): Promise<void> {
  console.log(chalk.blue(`Building Docker image for ${name}`));
  const flags = [
    "--platform linux/arm64",
    "-t",
    builderImageName(name),
    "-f",
    dockerFile,
    path.parse(dockerFile).dir,
  ];
  await $`docker buildx build ${flags}`;
}

//"docker buildx build --platform linux/amd64,linux/arm64 ."

export async function runBuilderImage(
  { repoDir }: BuildConfig,
  name: string
): Promise<void> {
  console.log(chalk.blue(`Building "${name}" with Docker`));
  const volumes = `${repoDir}:/build`;
  const flags = [
    "--rm",
    "-it",
    "-v",
    volumes,
    builderImageName(name),
    "/build.sh",
  ];
  await $`docker run ${flags}`;
}
