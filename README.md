---
### ⚠️ This repository is no longer maintained

This is a legacy repo for RevenueCat's documentation, and is no longer actively maintained.

View our current docs [here](https://docs.revenuecat.com/) or submit feedback to our support team [here](https://app.revenuecat.com/settings/support).

---

<div style="background-color: #fff3cd; color: #856404; border-left: 6px solid #ffeeba; padding: 0.5em;">
  <strong>⚠️</strong> This repo is no longer in use. Please use the new RevenueCat documentation repo: https://github.com/RevenueCat/docusaurus
</div>

# Writing Documentation in GitHub

## 🧐 Why GitHub?

We have switched from editing our [docs](https://www.revenuecat.com/docs) in ReadMe to editing them in GitHub. There are two reasons for the switch:

1. Code samples management:
    1. Reuse code blocks between files
    2. Have the code blocks in their own files with their own extension, which code editors like visual studio code will recognize and highlight possible errors
    3. Potentially unit test these code blocks (we don’t do this at the moment)
2. ReadMe’s native version control is immature compared to GitHub, and doesn’t offer essential features like branches and merging. This leads to duplicated or sometimes lost work when versions change. 
    1. To give a clear example, let’s say someone makes a change to version 4, while version 5 is getting ready to be published. There’s no easy way in Readme to bring those updates from v4 to v5 while this one is in the works.
    2. There’s also not a clear way to find out someone made a change to a particular version in Readme since edits can be made directly to the docs without using the “Suggested edits” functionality

#### If you aren't comfortable using GitHub, please let Support know or open an Issue with your requested change here: https://github.com/RevenueCat/revenuecat-docs/issues/new

## 🗂️ GitHub organization

[The repository](https://github.com/RevenueCat/revenuecat-docs) contains two important folders:

**docs_source** contains the raw markdown documents for editing

**rendered_docs** contains auto-generated docs in ReadMe-flavored markdown

**code_blocks** contains the code blocks (snippets) that get embedded in the files in the `rendered_docs` folder

## 🔧 How it works

Edit documents in **docs_source**. When you finish editing, open a pull request (PR).

When your PR is approved and merged, a CircleCI job is triggered to render the documents into ReadMe-flavored markdown inside the **rendered_docs** folder. This job will open a second PR which contains your rendered documents and should be reviewed thoroughly for any errors in the rendering process. 

When the second PR is reviewed and ready to be synced, manually approve the hold job called `manual-approval-to-sync-with-readme`. Another CircleCI build is triggered to send all of our docs to ReadMe through their API.

Finally, merge that syncing pull request into the `main` branch of the repository.

## 💻 Adding code snippets

We want to make it easy to unit test code snippets in the future. We also want to be able to use code linters and formatters on our code snippets. It’s pretty common to see in Readme code snippets that don’t have the correct indentation, or that broke with an SDK version update. To solve this, we decided to add the capability to have code snippets living in a different file than the document where they live. This file will have the right extension so code editors and GitHub detect the language they are written with. 

If you want to add a snippet to a file in the **docs_source** folder, create a file in the **code_blocks** folder with the right extension. For example *configuring_sdk.swift*, then add a reference to that snippet in the doc you want to edit inside the **docs_source** folder using a `[block:file]` tag:

```jsx
[block:file]
[{
  "language":"swift",
  "name":"Configure the SDK",
  "file":"code_blocks/configuring_sdk.swift"
}]
[/block]
```

If you want to add a tab with another language so it looks like this:

<img width="500" alt="code1" src="https://github.com/RevenueCat/revenuecat-docs/assets/110489217/74a5f259-fc56-44af-a410-966e4d1472c8">


Simply add a [block:file] block with a JSON array with the other files for the other snippets:

```jsx
[block:file]
[{
  "language":"swift",
  "name":"Configure the SDK",
  "file":"code_blocks/configuring_sdk.swift"
},
{
  "language":"objectivec",
  "name":"Configure the SDK",
  "file":"code_blocks/configuring_sdk.m"
}]
[/block]
```

## ⛓️ Current limitations

- ReadMe categories cannot be edited or rearranged in GitHub. They must be edited in ReadMe itself. This is due to limitations in the Readme API.
- When the second (auto-generated) PR is deleted, **your changes are still in the main branch.** Unless you revert these changes, they will be sent to GitHub the next time any synchronizing PR is approved. The synchronizing PR will show all the changes that will be synchronized after merged.

## 🎁 Features planned

- Allow folders in GitHub to be rearranged and edited, with those changes reflected in ReadMe
- Reduce the editing process to a single PR
- We don’t currently test any code block. In the future we are going to add unit testing for those files that live in `code_blocks` .  We are going to create projects in the different languages for that. We will probably keep the code blocks and the testing projects in the `revenuecat-docs` repository.

## 📄 Editing a single document

Small edits can easily be made within GitHub itself, without the need to clone (download) the repository.

### Pull request #1

Make a new branch in GitHub

<img width="430" alt="img1" src="https://github.com/RevenueCat/revenuecat-docs/assets/110489217/063f6b42-ebd4-4118-9fa6-ac33b6eacef2">

Select your file from **docs_source**

<img width="385" alt="img2" src="https://github.com/RevenueCat/revenuecat-docs/assets/110489217/9999c215-2b63-4b82-9353-3776402f2c57">

Click **Edit this file** in the upper-right corner

<img width="500" alt="img3" src="https://github.com/RevenueCat/revenuecat-docs/assets/110489217/5f67b98e-02ae-4bc3-9574-3c3bd7b792e9">

When you are done editing the document, click **Commit changes…** in the upper-right corner

<img width="500" alt="img4" src="https://github.com/RevenueCat/revenuecat-docs/assets/110489217/d9e5bcce-0afd-433c-89d5-9b8325c01b6e">

You can choose to start a pull request with the changes, if you don’t, navigate to the **Pull requests** tab. A banner will pop up with your new branch. Click **Compare & pull request**

<img width="500" alt="img5" src="https://github.com/RevenueCat/revenuecat-docs/assets/110489217/d816af65-ad19-461e-b2f0-3dbaa2815b94">

Make any changes to the PR template (1), select **RevenueCat/support** as a reviewer (2), and click **Create pull request** (3)

If you don't want to sync this Pull Request with ReadMe yet, add the prefix `[SKIP]` to the PR title. 

After getting your pull request reviewed by your team mates and making any necessary changes, click **Squash and merge** at the bottom of the page.
You can also add the `[SKIP]` prefix to the commit message if you're not planning on syncing changes yet. This is useful when batching several pull requests into a single sync.

### Pull request #2

A second PR will be auto-generated. After reviewing the **rendered_docs** in the PR, approve the PR:

<img width="500" alt="img6" src="https://github.com/RevenueCat/revenuecat-docs/assets/110489217/20df6f60-9659-4e9f-88e5-81e16c5f5c38">

Then un-hold the hold job called `manual-approval-to-sync-with-readme` in CircleCI:

<img width="500" alt="img7" src="https://github.com/RevenueCat/revenuecat-docs/assets/110489217/097c2e20-aab5-40f6-a780-c2945a11abee">
&nbsp
<img width="500" alt="img8" src="https://github.com/RevenueCat/revenuecat-docs/assets/110489217/62525850-f90b-445d-bccd-db3ae1ae7e84">
&nbsp
<img width="500" alt="img9" src="https://github.com/RevenueCat/revenuecat-docs/assets/110489217/126151c8-3a89-4beb-9153-dd14478d34c7">

A new job will start to run called `sync-files-if-syncing-pr`. When the job finishes and all checks have passed the docs will be synced. You can go ahead squash and merge the Pull Request:

<img width="500" alt="img10" src="https://github.com/RevenueCat/revenuecat-docs/assets/110489217/ee00b08e-29f9-45d7-a2be-9a71e34da313">

If you don’t want to sync the changes with Readme yet, feel free to close the pull request and delete the branch.

## 📑 Editing multiple documents

Once your branch is creating in the previous step, you can keep editing docs in that branch. Pick your branch in the home of the repository by clicking the caret down next to `main`:

<img width="430" alt="img11" src="https://github.com/RevenueCat/revenuecat-docs/assets/110489217/e6071278-425c-45ae-a526-d1350b7367f3">

Once in your branch, follow the same steps and navigate to another file and edit it.

<img width="500" alt="img12" src="https://github.com/RevenueCat/revenuecat-docs/assets/110489217/2b560227-788b-4388-8840-e889e114b78b">

After making the changes, and pressing the `Commit changes…` button, make sure you select `Commit directly to the ...` button, so the changes are pushed to the branch that was opened before.

<img width="335" alt="img13" src="https://github.com/RevenueCat/revenuecat-docs/assets/110489217/c6c81bc6-0b26-4f1e-b47b-143f7333f0e8">

**Note:** At this time, changing the folder of a doc, or removing whole folders is not supported. Feel free to reach out to [Support](https://revenuecat.slack.com/archives/CSSCSV4TF) for assistance, for these type of changes that require technical knowledge of Git.

## 🖊️ Markdown Tutorial

For a guide to writing in Markdown, see this [(hidden) page](https://www.revenuecat.com/docs/readme-markdown-tutorial) in our docs.

## Video Tutorials

<a href="https://www.loom.com/share/93733fcd62c443299ec902dc07ce28d5">
    <p>How to Sync Changes with Readme 🔄 - Watch Video</p>
    <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/93733fcd62c443299ec902dc07ce28d5-with-play.gif">
  </a>
  
<a href="https://www.loom.com/share/5d6a4b1188e34da29873eb65e65f5e2e">
    <p>Editing Code Snippet  👨‍💻 - Watch Video</p>
    <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/5d6a4b1188e34da29873eb65e65f5e2e-with-play.gif">
  </a>
  
<a href="https://www.loom.com/share/00b6932a5d5346e291f9d6c60780bd50">
    <p>How to Create a New Document in a New Folder 📂 - Watch Video</p>
    <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/00b6932a5d5346e291f9d6c60780bd50-with-play.gif">
  </a>
  
<a href="https://www.loom.com/share/075df6b931f94e0190574792cac5eaa1">
    <p>Creating a New Document in an Existing Folder 📝 - Watch Video</p>
    <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/075df6b931f94e0190574792cac5eaa1-with-play.gif">
  </a>

<a href="https://www.loom.com/share/182145b7c04d41d0b066cfaafbcbcf23">
    <p>How to Delete a Doc - Watch Video</p>
    <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/182145b7c04d41d0b066cfaafbcbcf23-with-play.gif">
  </a>

  <a href="https://www.loom.com/share/193831f5cb1148d8ace73c3a400cd6c6">
    <p>Organizing Docs Menu 📝 - Watch Video</p>
    <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/193831f5cb1148d8ace73c3a400cd6c6-with-play.gif">
  </a>

  
