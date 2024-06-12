<!-- 
    Programmer Name: Ms. Lim Jia Yong, Project Manager
    Description: Home / landing page for customers or unregistered user 
    Edited on: 28 February 2022
 -->

 @extends('layouts.app')

 @section('links')
     <link href="{{ asset('css/home.css') }}" rel="stylesheet">
     <link rel="icon" href="/images/White Logo.png" />
 @endsection
 
 @section('bodyID')
 {{ 'home' }}@endsection
 
 @section('navTheme')
 {{ 'dark' }}@endsection
 
 @section('logoFileName')
 {{ URL::asset('/images/White Logo.png') }}@endsection
 
 
 @section('content')
 <section class="banner">
     <div class="container">
         <div class="col-md-10 col-lg-8 details">
             <h3>KFC VIET NAM</h3>
             <h1>"Exploring the Iconic Catchphrase and Its Influence”</h1>
             <a href="{{ route('menu') }}" class="btn primary-btn" style="width:250px;">Discover menu</a>
         </div>
     </div>
 </section>
 <section>
     <div class="image-about">
         
     </div>
 </section>
 <section class="chefs">
     <div class="container">
         <h2 class="title flex-center">TEAM MEMBERS</h2>
         <div class="row justify-content-evenly align-items-center chefs-wrapper">
             <div class="card col-lg-3 col-md-8 col-10 mt-5">
                 <div class="chef-img d-flex align-items-center justify-content-center">
                     <img src="/images/chef1.png" alt="">
                 </div>
                 <div class="chef-desc d-flex flex-column align-items-center justify-content-start">
                     <p class="chef-name">Le Hoai Nam</p>
                     <p class="chef-position">Master Chef</p>
                 </div>
             </div>
             <div class="card col-lg-3 col-md-8 col-10 mt-5">
                 <div class="chef-img d-flex align-items-center justify-content-center">
                     <img src="/images/chef2.png" alt="">
                 </div>
                 <div class="chef-desc d-flex flex-column align-items-center justify-content-start">
                     <p class="chef-name">Nguyen Van Loi</p>
                     <p class="chef-position">Master Chef</p>
                 </div>
             </div>
             <div class="card col-lg-3 col-md-8 col-10 mt-5">
                 <div class="chef-img d-flex align-items-center justify-content-center">
                     <img src="/images/chef3.png" alt="">
                 </div>
                 <div class="chef-desc d-flex flex-column align-items-center justify-content-start">
                     <p class="chef-name">Vo Chi Thanh</p>
                     <p class="chef-position">Let him cook</p>
                 </div>
             </div>
         </div>
     </div>
 </section>
 
 <section class="contact">
     <div class="container">
         <h2 class="title flex-center">CONTACT US</h2>
         <div class="flex-center contact-wrapper">
         <div class="form-wrapper flex-center">
             <form>
                 <div class="mb-3">
                     <label for="name" class="form-label">Name</label>
                     <input type="text" class="form-control" id="name" aria-describedby="emailHelp">
                 </div>
                 <div class="mb-3">
                     <label for="email" class="form-label">Email</label>
                     <input type="email" class="form-control" id="email">
                     <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                 </div>
                 <div class="mb-3">
                     <label for="message" class="form-label">Message</label>
                     <textarea class="form-control" id="message" style="height: 100px"></textarea>
                 </div>
                 <div class="w-100 flex-center">
                 <a href="mailto:zensushi.sdp@gmail.com" class="primary-btn msg-btn w-100 px-3 py-2 text-center rounded">
                     Send Message
                 </a>
                 </div>
             </form>
         </div>
 
         <div class="gmap flex-center">
             <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.0624766960423!2d106.62628677493325!3d10.806526989344096!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752be2853ce7cd%3A0x4111b3b3c2aca14a!2zMTQwIMSQLiBMw6ogVHLhu41uZyBU4bqlbiwgVMOieSBUaOG6oW5oLCBUw6JuIFBow7osIFRow6BuaCBwaOG7kSBI4buTIENow60gTWluaCwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1716298538429!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
         </div>
 
         </div>
     </div>
 </section>
 @endsection