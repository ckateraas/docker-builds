export default {
  input: "build/index.js",
  output: {
    file: "bundle.js",
    format: "cjs",
  },
  external: ["globby", "node-fetch"],
  plugins: [],
};
