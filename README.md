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

## 🗂️ Github organization

[The repository](https://github.com/RevenueCat/revenuecat-docs) contains two important folders:

**************docs_source************** contains the raw markdown documents for editing

**************************rendered_docs************************** contains auto-generated docs in ReadMe-flavored markdown

**************code_blocks************** contains the code blocks (snippets) that get embedded in the files in the `rendered_docs` folder

## 🔧 How it works

Edit documents in ********************docs_source********************. When you finish editing, open a pull request (PR).

When your PR is approved, a CircleCI job is triggered to render the documents into ReadMe-flavored markdown in **************************rendered_docs.**************************

A second PR will be automatically generated. This PR contains your rendered documents and should be reviewed thoroughly for any errors in the rendering process. 

When the second PR is approved, another CircleCI build is triggered to send all of our docs to ReadMe through their API.

## 💻 Adding code snippets

We want to make it easy to unit test code snippets in the future. We also want to be able to use code linters and formatters on our code snippets. It’s pretty common to see in Readme code snippets that don’t have the correct indentation, or that broke with an SDK version update. To solve this, we decided to add the capability to have code snippets living in a different file than the document where they live. This file will have the right extension so code editors and GitHub detect the language they are written with. 

If you want to add a snippet to a file in the **docs_source** folder, create a file in the **************code_blocks************** folder with the right extension. For example *configuring_sdk.swift*, then add a reference to that snippet in the doc you want to edit inside the **docs_source** folder using a `[block:file]` tag:

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

![Screenshot 2023-06-09 at 5.14.17 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/becfe188-cfaf-4372-833d-7bd222373f43/Screenshot_2023-06-09_at_5.14.17_PM.png)

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
- When the second (auto-generated) PR is deleted, ******************************************************************************************************************************your changes are still in the main branch.************************************************************************************* Unless you revert these changes, they will be sent to Github the next time any synchronizing PR is approved. The synchronizing PR will show all the changes that will be synchronized after merged.

## 🎁 Features planned

- Allow folders in Github to be rearranged and edited, with those changes reflected in ReadMe
- Reduce the editing process to a single PR
- We don’t currently test any code block. In the future we are going to add unit testing for those files that live in `code_blocks` .  We are going to create projects in the different languages for that. We will probably keep the code blocks and the testing projects in the `revenuecat-docs` repository.

## 📄 Editing a single document

Small edits can easily be made within Github itself, without the need to clone (download) the repository.

### Pull request #1

1. Make a new branch in Github

![Choose a descriptive name, such as [your name]/[description]](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/eba6c5bb-c394-44a9-83a9-a53a29e2106b/SCR-20230609-ikig.png)

Choose a descriptive name, such as [your name]/[description]

1. Select your file from **********************docs_source**********************

![SCR-20230609-ipsg.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/8ad9abc8-b541-429b-92b4-6721b27d7708/SCR-20230609-ipsg.png)

1. Click **Edit this file** in the upper-right corner

![SCR-20230609-iqcb.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4d541363-53e9-49f4-abc6-2b99f456ef45/SCR-20230609-iqcb.png)

1. When you are done editing the document, click **Commit changes…** in the upper-right corner

![Add a descriptive message in the pop-up that follows.](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/41c1f67d-b935-42c6-9240-6be290b3dec2/SCR-20230609-iqnd.png)

Add a descriptive message in the pop-up that follows.

1. You can choose to start a pull request with the changes, if you don’t, navigate to the ************Pull requests************ tab. A banner will pop up with your new branch. Click ********************************************Compare & pull request********************************************

![If the banner is missing, click ********************************New pull request******************************** and select your branch](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a70534ee-511d-4530-b57e-981a74db7a05/SCR-20230609-irhq.png)

If the banner is missing, click ********************************New pull request******************************** and select your branch

1. Make any changes to the PR template (1), select ****************RevenueCat/support**************** as a reviewer (2), and click ************************Create pull request************************ (3)

### Pull request #2

A second PR will be auto-generated. After reviewing the **************************rendered_docs************************** in the PR, approve the PR squash and merge it.

![Screenshot 2023-06-09 at 6.34.09 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a059a4a1-845e-4768-8675-ad66d99c28a0/Screenshot_2023-06-09_at_6.34.09_PM.png)

![Screenshot 2023-06-09 at 6.33.25 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4f28058f-701a-4782-a490-d90f0026e1c4/Screenshot_2023-06-09_at_6.33.25_PM.png)

## 📑 Editing multiple documents

Once your branch is creating in the previous step, you can keep editing docs in that branch. Pick your branch in the home of the repository by clicking the caret down next to `main`:

![Screenshot 2023-06-09 at 5.26.08 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/705a6409-432e-4375-83eb-b0970b9db45b/Screenshot_2023-06-09_at_5.26.08_PM.png)

Once in your branch, follow the same steps and navigate to another file and edit it.

![SCR-20230609-iqcb.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4d541363-53e9-49f4-abc6-2b99f456ef45/SCR-20230609-iqcb.png)

After making the changes, and pressing the `Commit changes…` button, make sure you select `Commit directly to the ...` button, so the changes are pushed to the branch that was opened before.

![Screenshot 2023-06-09 at 5.32.32 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f2727d44-5573-4c5d-af6c-75267c3558bb/Screenshot_2023-06-09_at_5.32.32_PM.png)

************Note:************ At this time, changing the folder of a doc, or removing whole folders is not supported. Feel free to reach out to [Support](https://revenuecat.slack.com/archives/CSSCSV4TF) for assistance, for these type of changes that require technical knowledge of Git.

## 🖊️ Markdown Tutorial

For a guide to writing in Markdown, see this [(hidden) page](https://www.revenuecat.com/docs/readme-markdown-tutorial) in our docs.

## Video Tutorials
