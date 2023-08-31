import { Purchases, LOG_LEVEL } from '@revenuecat/purchases-capacitor';

const Tab1: React.FC = () => {
  useEffect(() => {
    (async function () {
      await Purchases.setLogLevel({ level: LOG_LEVEL.DEBUG }); // Enable to get debug logs
      await Purchases.configure({
        apiKey: "my_api_key",
        appUserID: "my_app_user_id" // Optional
      });
    })();
  }, []);
  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonTitle>Tab 1</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        <IonButton onClick={openScanner}>Scan barcode</IonButton>
      </IonContent>
    </IonPage>
  );
};