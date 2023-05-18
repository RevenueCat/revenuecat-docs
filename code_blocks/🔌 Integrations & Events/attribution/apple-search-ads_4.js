export default class App extends React.Component {
 
  componentDidMount() {
    Purchases.setDebugLogsEnabled(true);
    
    if (Platform.OS === 'ios') {
    	await Purchases.setup("public_ios_sdk_key");
    } else if (Platform.OS === 'android') {
    	await Purchases.setup("public_google_sdk_key");
      
      // OR: if building for Amazon, be sure to follow the installation instructions then:
    	await Purchases.setup({ apiKey: "public_amazon_sdk_key", useAmazon: true });
    }
    
    await Purchases.enableAdServicesAttributionTokenCollection();
    
  }
}