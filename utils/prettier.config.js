module.exports = {
  printWidth: 100,
  tabWidth: 2,
  singleQuote: false,
  bracketSameLine: true,
  trailingComma: "es5",

  plugins: [
    require.resolve("prettier-plugin-tailwindcss"),
    require.resolve("eslint-plugin-prettier/recommended"),
  ],
  tailwindAttributes: ["className"],
};
