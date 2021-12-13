import { path } from "zx";
import { parseArgs } from "./argParse.js";
import { buildImage, runBuilderImage } from "./docker.js";
import { cloneRepo, gitCheckoutTag, updateRepo } from "./git.js";
import { confirmConfigIsOk } from "./utils.js";

void (async function buildBat(): Promise<void> {
  const buildConfig = await parseArgs();
  const configIsOk = await confirmConfigIsOk(buildConfig);
  if (!configIsOk) {
    return;
  }
  await cloneRepo(buildConfig, true);
  await updateRepo(buildConfig);
  if (buildConfig.tag) {
    await gitCheckoutTag(buildConfig);
  }
  const name = path.parse(buildConfig.workDir).name;
  await buildImage(buildConfig, name);
  await runBuilderImage(buildConfig, name);
})();
