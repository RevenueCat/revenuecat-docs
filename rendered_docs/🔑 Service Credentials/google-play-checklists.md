---
title: Google Play Checklists
slug: google-play-checklists
excerpt: Check your configuration setup step by step.
hidden: true
metadata:
  title: Google Play Checklists
  description: Check your configuration set up step by step.
createdAt: '2023-04-25T20:10:32.492Z'
updatedAt: '2023-04-27T21:21:48.877Z'
category: 64515c3e4658730013edcee5
---
The processes for setting up Google Play service credentials and real-time developer notifications to communicate with RevenueCat on your behalf can be complex, and span across multiple consoles and dashboards. Use this handy checklist to go through and make sure you hit each step in your configuration.

Note that while our [credentials guide](doc:creating-play-service-credentials) and our [developer notifications guide](doc:google-server-notifications) will move back and forth between the Google Play Console, the Google Cloud Console, and the RevenueCat dashboard, we've combined the steps into categories for ease of use.

***



# Google Play Service Credentials Checklist

## In Google Cloud:

- [ ] I have created, either during this process or previously, a Google Cloud project dedicated to this app
- [ ] I have created a service account under the above Cloud project 
- [ ] I have given the service account the roles of **Pub/Sub Admin** and **Monitoring Viewer**
- [ ] I have created and downloaded a JSON public key under the service account I created

## In Google Play:

- [ ] I have linked the previously created Google Cloud project to my app under API Access
- [ ] Under the previously created service account, I clicked '**Manage Play Console Permissions**' and added the following permissions:
  - [ ] View app information and download bulk reports (read-only)
  - [ ] View financial data, orders, and cancellation survey response
  - [ ] Manage orders and subscriptions
- [ ] I invited the user and the service account is showing as active in '**Users and Permissions**'
- [ ] After confirming permissions, I selected '**Apply**', then '**Save Changes**'

## In RevenueCat:

- [ ] I added the previously downloaded JSON key file to the RevenueCat dashboard and clicked '**Save Changes**'
- [ ] I've waited at least 36 hours

***



# Google Real-Time Developer Notifications Checklist

- [ ] I have waited to ensure that my service credentials are set up correctly and working as expected

## In Google Cloud:

- [ ] I have enabled the Pub/Sub API for the same project I created service credentials with

## In RevenueCat:

- [ ] I have chosen either an existing Pub/Sub Topic ID or created a new one
- [ ] I have clicked '**Connect to Google**'
- [ ] I have copied the topic ID that generated after connecting

## In Google Play:

- [ ] Under the '**Monetize**' section, in '**Monetization Setup**', I have pasted the previously copied topic ID next to '**Topic name**'
- [ ] I have saved changes and did not see any errors
- [ ] I clicked '**Send Test Notification**' and confirmed it was received in the RevenueCat dashboard