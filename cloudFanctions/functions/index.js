const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp(functions.config().functions);

var newData;

exports.myTrigger = functions.firestore.document('Notifications/{id}').onCreate(async (snapshot, context) => {
    if (snapshot.empty) {
        console.log('No Devices');
        return;
    }

    var tokens = [];
    newData = snapshot.data();

    const deviceIdTokens = await admin.firestore().collection('users').get();

    for (var token of deviceIdTokens.docs) {
        tokens.push(token.data().token);
    }

    var titles = [];
    tnewData = snapshot.data();

    const titalgetar = await admin.firestore().collection('Notifications').get();

    for (var title of titalgetar.docs) {
        titles.push(title.data().title);
    }

    var bodys = [];
    bnewData = snapshot.data();

    const bodygetar = await admin.firestore().collection('Notifications').get();

    for (var body of bodygetar.docs) {
        bodys.push(body.data().body);
    }


    var payload = {
        notification: { title: tnewData.title , body: bnewData.body, sound: 'default',},
        data: {click_action: 'FLUTTER_NOTIFICATION_CLICK',message: 'same'},
    };

    try {
        const response = await admin.messaging().sendToDevice(tokens, payload);
        console.log('Notification sent successfully');
    } catch (err) {
        console.log(err);
    }
});
var anewData;
exports.orderTrigger = functions.firestore.document('Payment/{id}').onCreate(async (snapshot, context) => {
    if (snapshot.empty) {
        console.log('No Devices');
        return;
    }

    var atokens = [];
    anewData = snapshot.data();

    const deviceIdTokens = await admin.firestore().collection('AdminToken').get();

    for (var token of deviceIdTokens.docs) {
        atokens.push(token.data().token);
    }

    var atitles = [];
    atnewData = snapshot.data();

    const atitalgetar = await admin.firestore().collection('Payment').get();

    for (var restaurantName of atitalgetar.docs) {
        atitles.push(restaurantName.data().title);
    }

    var abodys = [];
    abnewData = snapshot.data();

    const abodygetar = await admin.firestore().collection('Payment').get();

    for (var mainOfferDetails of abodygetar.docs) {
        abodys.push(mainOfferDetails.data().body);
    }


    var apayload = {
        notification: { title: atnewData.title , body: bnewData.body, sound: 'default',},
        data: {click_action: 'FLUTTER_NOTIFICATION_CLICK',message: 'same'},
    };

    try {
        const response = await admin.messaging().sendToDevice(atokens, apayload);
        console.log('Notification sent successfully');
    } catch (err) {
        console.log(err);
    }
});
