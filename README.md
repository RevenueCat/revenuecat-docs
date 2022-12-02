# hackathon-readme-snippets
Repository to hold the Hackathon project for syncing snippets with Readme


### how to sync docs to readme: 
- `npm install -g rdme`
- `npm install -g embedme`
- log in, project `revenuecat`
- copy docs source to the render folder: `cp -r docs_source/** rendered_docs/`
- render docs (this embeds the code snippets): `embedme "rendered_docs/**/*.md"`
- run manual sync: `rdme docs rendered_docs --version=4.0`
