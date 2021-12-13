import type { ProcessOutput } from "zx";

export type Version = `${number}.${number}.${number}-${number}`;
export type FilePath = string & { __brand: "filePath" };
export type DirPath = string & { __brand: "dirPath" };

export type BuildConfig = {
  repoUrl: string;
  repoDir: DirPath;
  workDir: DirPath;
  tag?: string;
  dockerFile: FilePath;
};

export function isProcessOutput(object: unknown): object is ProcessOutput {
  return !!object && !!(object as ProcessOutput).exitCode;
}

export type PackageConfig = BuildConfig & {
  packageName: string;
  artifactVersion: Version;
};
