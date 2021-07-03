<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>About Us</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css">
  </head>
  <body>

  <section class="section">
  
    <div class="container">
      <h1 class="title">
       About Us
      </h1>
      <br>
      <p class="subtitle">
       From traditional punch cards to modern access cards and biometric systems, tracking employee working hours has been an essential process. Employees are expected to keep track of their check-in time once they arrive for work and note down their check-out time when they leave. In reality, most employees fill out their timesheets in a hurry, right before they leave for the day.

In worst-case scenarios, this process happens only on the last day of the week/month, right before they turn in timesheets to HR. Manual timekeeping practices take a toll on employee productivity and morale. Filling out working hours days or weeks after the actual working day will only lead to inaccuracies, timesheet tampering, and so on.
      </p>
    </div>
  </section>
  
    <section class="section">
  
    <div class="container">
      <h1 class="title">
       Our Team
      </h1>
      <br>
   <div class="ourteam" style="display:flex; justify-content: space-around;">
   <div class="card">
  <div class="card-image">
    <figure class="image is-4by3">
      <img src="./profile.jpg" alt="Placeholder image">
    </figure>
  </div>
  <div class="card-content">
    <div class="media">
      <div class="media-left">
      </div>
      <div class="media-content">
        <p class="title is-4">Navneet Kumar Singh</p>
        <p class="subtitle is-6">190031177@kluniversity.in</p>
      </div>
    </div>

    <div class="content">
     Hey there my name is Navneet Kumar Singh and 
     I am a student of KL University currently studying Btech cse in 2nd year.
     
    </div>
  </div>
</div>
<div class="card">
  <div class="card-image">
    <figure class="image is-4by3">
      <img src="./photo_2021-04-22_18-51-23.jpg" alt="Placeholder image">
    </figure>
  </div>
  <div class="card-content">
    <div class="media">
      <div class="media-left">
      </div>
      <div class="media-content">
        <p class="title is-4">Maremanda Sree Krishna</p>
        <p class="subtitle is-6">190031020@kluniversity.in</p>
      </div>
    </div>

    <div class="content">
        Hey there my name is Sree Krishna Maremanda and i am a student of KL University currently studying Btech cse in 2nd year.
    </div>
  </div>
</div>
   <div class="card">
  <div class="card-image">
    <figure class="image is-4by3">
      <img src="https://tleliteracy.com/wp-content/uploads/2017/02/default-avatar.png" alt="Placeholder image">
    </figure>
  </div>
  <div class="card-content">
    <div class="media">
      <div class="media-left">
      </div>
      <div class="media-content">
        <p class="title is-4">Sai Prasanna</p>
        <p class="subtitle is-6">190031442@kluniversity.in</p>
      </div>
    </div>

    <div class="content">
     Hey there my name is Sai Prasanna and 
     I am a student of KL University currently studying Btech cse in 2nd year.
    </div>
  </div>
</div>
   
   
   </div>
    </div>
  </section>
   <script>
(function() {
    var burger = document.querySelector('.burger');
    var menu = document.querySelector('#'+burger.dataset.target);
    burger.addEventListener('click', function() {
        burger.classList.toggle('is-active');
        menu.classList.toggle('is-active');
    });
})();


</script>
  </body>
</html>