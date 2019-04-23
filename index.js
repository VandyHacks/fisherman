const csv = require("csvtojson");
const fetch = require('node-fetch');

function normalizeRepoPath(url) {
  const [_, rest] = url.split("//github.com/");
  let [owner, repo] = rest.split("/");
  if (repo.endsWith(".git")) {
    repo = repo.substring(0, repo.length - 4);
  }
  return { owner, repo };
}

async function repoFirstCommit({owner, repo}) {
    const res = await fetch(`https://repo-first-commit.now.sh/${owner}/${repo}`);
    const parsed = await res.json();
    return parsed;
}

async function main() {
  let data = await csv().fromFile("./devpost.csv");
  const paths = data
    .map(el => el.Website)
    .filter(el => el.includes("//github.com"))
    .map(normalizeRepoPath);

  for (const path of paths) {
      let result = await repoFirstCommit(path);
      try {
        console.log(result.commit.committer.date);
      } catch (e) {
          console.error('Skipping ' + JSON.stringify(path))
          console.log(e)
      }
  }
}

main();
 
