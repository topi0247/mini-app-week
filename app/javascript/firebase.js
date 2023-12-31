import { initializeApp } from "https://www.gstatic.com/firebasejs/10.7.1/firebase-app.js";
import { getAuth, signInWithEmailAndPassword } from "https://www.gstatic.com/firebasejs/8.10.1/firebase-auth.js";
const firebaseConfig = {
  apiKey: ENV['apiKey'],
  authDomain: ENV['authDomain'],
  projectId: ENV['projectId'],
  storageBucket: ENV['storageBucket'],
  messagingSenderId: ENV['messagingSenderId'],
  appId: ENV['appId']
};

const app = initializeApp(firebaseConfig);

$(document).ready(function () {
  $('#login').submit(function (e) {
    console.log("aaa");
    e.preventDefault();

    // フォームのデータを取得
    var formData = $(this).serialize();

    const auth = getAuth();
    signInWithEmailAndPassword(auth, this.email, this.password)
      .then(() => {
        $.ajax({
          url: login_path,
          type: 'POST',
          data: formData,
          success: function (response) {
            console.log('Login successful');
          },
          error: function (error) {
            console.log('Login failed');
          }
        });
      })
      .catch((error) => {
          console.log(error);
      })
  });
});