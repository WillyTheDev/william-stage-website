import * as functions from 'firebase-functions';
import admin = require('firebase-admin');

admin.initializeApp();
const db = admin.firestore();
const fcm = admin.messaging();
//
export const newMessageNotif = functions.firestore
  .document("Chat/{roomRef}/Chat/{msg}")
  .onCreate(async (snapshot, context) => {
    const data = snapshot.data();
    const sender = data.sender
    


    console.log("Step 2:", sender,);
    const querySnapshot = (await db
      .collection('Users')
      .doc("william.scholder@gmail.com")
      .collection('Tokens')
      .doc("token")
      .get()).data()!;

    const tokens = querySnapshot.token;
    console.log("Step 3:", tokens,);
    const payload: admin.messaging.MessagingPayload = {
      notification: {
        title: `${data.sender} has set a new Message`,
        body: "Go check it in the App",
        icon: 'your-icon-url',
        click_action: 'FLUTTER_NOTIFICATION_CLICK'
      }
    };
    return fcm.sendToDevice(tokens, payload);
  })
