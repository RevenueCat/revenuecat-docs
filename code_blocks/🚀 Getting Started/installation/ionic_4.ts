import { Purchases } from '@awesome-cordova-plugins/purchases';

const Tab1: React.FC = () => {
  Purchases.setDebugLogsEnabled(true);
  Purchases.purchases.configureWith({
    apiKey: "my_api_key",
    appUserID: "my_app_user_id"
  });
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