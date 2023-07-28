# Writing Documentation in Github

## 🧐 Why Github?

We have switched from editing our [docs](https://www.revenuecat.com/docs) in ReadMe to editing them in Github. There are two reasons for the switch:

1. Code samples management:
    1. Reuse code blocks between files
    2. Have the code blocks in their own files with their own extension, which code editors like visual studio code will recognize and highlight possible errors
    3. Potentially unit test these code blocks (we don’t do this at the moment)
2. ReadMe’s native version control is immature compared to Github, and doesn’t offer essential features like branches and merging. This leads to duplicated or sometimes lost work when versions change. 
    1. To give a clear example, let’s say someone makes a change to version 4, while version 5 is getting ready to be published. There’s no easy way in Readme to bring those updates from v4 to v5 while this one is in the works.
    2. There’s also not a clear way to find out someone made a change to a particular version in Readme since edits can be made directly to the docs without using the “Suggested edits” functionality

#### If you aren't comfortable using Github, please let Support know or open an Issue with your requested change here: https://github.com/RevenueCat/revenuecat-docs/issues/new

## 🗂️ Github organization

[The repository](https://github.com/RevenueCat/revenuecat-docs) contains two important folders:

**docs_source** contains the raw markdown documents for editing

**rendered_docs** contains auto-generated docs in ReadMe-flavored markdown

**code_blocks** contains the code blocks (snippets) that get embedded in the files in the `rendered_docs` folder

## 🔧 How it works

Edit documents in **docs_source**. When you finish editing, open a pull request (PR).

When your PR is approved, a CircleCI job is triggered to render the documents into ReadMe-flavored markdown inside the **rendered_docs**.

A second PR will be automatically generated. This PR contains your rendered documents and should be reviewed thoroughly for any errors in the rendering process. 

When the second PR is approved and ready to be synced, manually approve the hold job called `manual-approval-to-sync-with-readme` another CircleCI build is triggered to send all of our docs to ReadMe through their API.

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

![image](https://github.com/RevenueCat/revenuecat-docs/assets/664544/e7adf318-332a-4089-ba4b-84807cdb72d0)


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

## ⛓️ Current limitations

- ReadMe categories cannot be edited or rearranged in Github. They must be edited in ReadMe itself. This is due to limitations in the Readme API.
- When the second (auto-generated) PR is deleted, **your changes are still in the main branch.** Unless you revert these changes, they will be sent to Github the next time any synchronizing PR is approved. The synchronizing PR will show all the changes that will be synchronized after merged.

## 🎁 Features planned

- Allow folders in Github to be rearranged and edited, with those changes reflected in ReadMe
- Reduce the editing process to a single PR
- We don’t currently test any code block. In the future we are going to add unit testing for those files that live in `code_blocks` .  We are going to create projects in the different languages for that. We will probably keep the code blocks and the testing projects in the `revenuecat-docs` repository.

## 📄 Editing a single document

Small edits can easily be made within Github itself, without the need to clone (download) the repository.

### Pull request #1

1. Make a new branch in Github

![Choose a descriptive name, such as [your name]/[description]](https://github.com/RevenueCat/revenuecat-docs/assets/664544/2105b93c-c7f1-4017-8867-35f5248b97ae)

1. Select your file from **docs_source**

<img width="406" alt="Screenshot 2023-06-26 at 4 06 36 PM" src="https://github.com/RevenueCat/revenuecat-docs/assets/664544/a0d7e9b2-706d-4312-8d6e-bc41fff233be">

1. Click **Edit this file** in the upper-right corner

<img width="544" alt="Screenshot 2023-06-26 at 4 06 52 PM" src="https://github.com/RevenueCat/revenuecat-docs/assets/664544/b899b891-25e1-49fa-a219-19f047793828">

1. When you are done editing the document, click **Commit changes…** in the upper-right corner

<img width="536" alt="Add a descriptive message in the pop-up that follows." src="https://github.com/RevenueCat/revenuecat-docs/assets/664544/b397d44e-6de7-4c6c-b49b-a5fef6981899">

1. You can choose to start a pull request with the changes, if you don’t, navigate to the **Pull requests** tab. A banner will pop up with your new branch. Click **Compare & pull request**

<img width="634" alt="If the banner is missing, click ********************************New pull request******************************** and select your branch" src="https://github.com/RevenueCat/revenuecat-docs/assets/664544/c7cea5c0-1f35-406f-9549-ebbf15a7fd18">

1. Make any changes to the PR template (1), select **RevenueCat/support** as a reviewer (2), and click **Create pull request** (3)

### Pull request #2

A second PR will be auto-generated. After reviewing the **rendered_docs** in the PR, approve the PR:

![Screenshot 2023-06-09 at 6.34.09 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a059a4a1-845e-4768-8675-ad66d99c28a0/Screenshot_2023-06-09_at_6.34.09_PM.png)

Then un-hold the hold job called `manual-approval-to-sync-with-readme` in CircleCI:

![image](https://github.com/RevenueCat/revenuecat-docs/assets/664544/d611dc44-0340-48d7-9fb3-85ff3cf556ad)

![image](https://github.com/RevenueCat/revenuecat-docs/assets/664544/26c2ef60-09f4-46be-b90a-38876377fe1a)

![image](https://github.com/RevenueCat/revenuecat-docs/assets/664544/86b4bdc9-748e-4812-bd3e-e7daf0b8e1aa)

A new job will start to run called `sync-files-if-syncing-pr`. When the job finishes and all checks have passed the docs will be synced. You can go ahead squash and merge the Pull Request:

![Screenshot 2023-06-09 at 6.33.25 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4f28058f-701a-4782-a490-d90f0026e1c4/Screenshot_2023-06-09_at_6.33.25_PM.png)

If you don’t want to sync the changes with Readme yet, feel free to close the pull request and delete the branch.

## 📑 Editing multiple documents

Once your branch is creating in the previous step, you can keep editing docs in that branch. Pick your branch in the home of the repository by clicking the caret down next to `main`:

<img width="460" alt="Screenshot 2023-06-26 at 4 08 54 PM" src="https://github.com/RevenueCat/revenuecat-docs/assets/664544/3b33477c-8adc-4439-afce-efe402e3b54f">

Once in your branch, follow the same steps and navigate to another file and edit it.

<img width="543" alt="Screenshot 2023-06-26 at 4 09 05 PM" src="https://github.com/RevenueCat/revenuecat-docs/assets/664544/77268b41-9934-4dcf-9f94-5c501e3e2b14">

After making the changes, and pressing the `Commit changes…` button, make sure you select `Commit directly to the ...` button, so the changes are pushed to the branch that was opened before.

<img width="345" alt="Screenshot 2023-06-26 at 4 09 18 PM" src="https://github.com/RevenueCat/revenuecat-docs/assets/664544/93cde391-bc7b-4f1d-83c2-1f8c7644c1f1">

**Note:** At this time, changing the folder of a doc, or removing whole folders is not supported. Feel free to reach out to [Support](https://revenuecat.slack.com/archives/CSSCSV4TF) for assistance, for these type of changes that require technical knowledge of Git.

## 🖊️ Markdown Tutorial

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

  
