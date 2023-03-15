import { Platform } from "@ionic/angular";
import { Purchases } from "@awesome-cordova-plugins/purchases/ngx";

constructor(public platform: Platform, private purchases: Purchases) {
    platform.ready().then(() => {
        this.purchases.setDebugLogsEnabled(true); // Enable to get debug logs
        this.purchases.setup("my_api_key", "my_app_user_id");
        this.purchases.configureWith({
            apiKey: "my_api_key",
            appUserID: "my_app_user_id"
        });
    }
}