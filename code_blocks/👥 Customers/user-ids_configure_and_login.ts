// Configure Purchases on app launch
await Purchases.configure({ apiKey: <public_sdk_key> });

//...

// Later log in provided user Id
try {
  const logInResult = await Purchases.logIn({ appUserID: <my_app_user_id>});
} catch (error) {
  // Handle error logging in
}
