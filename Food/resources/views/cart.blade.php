<!-- 
    Programmer Name: Mr. Tan Wei Kang, Developer
    Description: A page that displays the customer's cart items and allow them to make checkouts.
    Edited on: 8 April 2022
 -->

 @extends('layouts.app')

 @section('links')
     <link href="{{ asset('css/home.css') }}" rel="stylesheet">
     <link rel="icon" href="/images/White Logo.png" />
 @endsection
 
 @section('bodyID')
 {{ 'cart' }}@endsection
 
 @section('navTheme')
 {{ 'light' }}@endsection
 
 @section('logoFileName')
 {{ URL::asset('/images/Black Logo.png') }}@endsection
 
 
 @section('content')
 <section class="cart" style="margin-top: 20vh;">
     <div class="container">
         <h2 class="d-flex justify-content-center">YOUR CART</h2>
 
         @if (session('success'))
         <div class="alert alert-success fixed-bottom" role="alert" style="width:500px;left:30px;bottom:20px">
             {{ session('success') }}
         </div>
         @elseif (session('error'))
         <div class="alert alert-warning fixed-bottom" role="alert" style="width:500px;left:30px;bottom:20px">
             {{ session('error') }}
         </div>
         @endif
         @if ($cartItems->count())
 
             <div class="container py-5">
                 <div class="card col-md-6 col-12 offset-md-3">
                     <div class="card-body">
                         <h4 class="card-title mb-5 mx-2">KFC Viet Nam | Your carts <span class="text-secondary h5">- {{ $cartItems->count() }} Items</span></h4>
 
                         @foreach ($cartItems as $item)
                             <div class="w-100 px-3 d-flex align-items-center py-3">
                                 <div class="col-2">
                                     <img src="{{ asset('menuImages/' . $item->menu->image) }}" alt="cart item image" class="img-fluid">
                                 </div>
                                 <div class="col-6 px-4">
                                     <h5 class="text-dark">{{ $item->menu->name }}</h5>
                                     <h5 class="text-secondary">Price: {{ number_format($item->menu->price * $item->quantity,0) }} VND</h5>
                                 </div>
                                 <div class="col-4 d-flex align-items-baseline justify-content-end">
                                     <!-- Decrement button -->
                                     <form action="{{ route('cartUpdate', $item) }}" method="post">
                                         @csrf
                                         @method('PUT')
                                         <input type="hidden" name="cartAction" value="-">
                                         <button type="submit" class="btn btn-outline-secondary">-</button>
                                     </form>
                                     <!-- Quantity -->
                                     <h5 class="mx-4">{{ $item->quantity }}</h5>
                                     <!-- Increment button -->
                                     <form action="{{ route('cartUpdate', $item) }}" method="post">
                                         @csrf
                                         @method('PUT')
                                         <input type="hidden" name="cartAction" value="+">
                                         <button type="submit" class="btn btn-outline-secondary">+</button>
                                     </form>   
                                 </div>
                             </div>
                         @endforeach
                         <div class="d-flex justify-content-between px-3 mt-5">
                             <h5 class="text-dark">Subtotal</h5>
                             <h5 class="text-dark">Price: {{ number_format($subtotal,0) }} (VND)</h5>
                         </div>
 
                         <!-- CHECKOUT ALONG WITH DISCOUNT CODE APPLICATION START -->
                         <form action="{{ route('cartCheckout') }}" method="post">
                             @csrf
                             <div class="d-flex flex-column px-3 mt-5 col-12 align-items-center">
                                 <h5 class="text-secondary">Discount Code</h5>
                                 <input type="text" class="form-control mt-3" name="discountCode" id="discountCode" placeholder="Place your discount code here...">
                             </div>
 
                             <h5 class="text-secondary mt-5 text-center">Order Date and Time</h5>
                             <div class="d-flex flex-column mt-4 px-3">
                                 <!-- Select Date time (only applicable for dine in / take away, not dine in now) -->
                                 <!-- Perform validation to ensure they don't select time that has passed -->
                                 <input class="form-control @error('dateTime') is-invalid @enderror" 
                                 name="dateTime" type="datetime-local" value="{{ old('dateTime') }}" required>
                                 @error('dateTime')
                                     <span class="invalid-feedback" role="alert">
                                         <strong>{{ $message }}</strong>
                                     </span>
                                 @enderror
                             </div>
 
                             <!-- Dine in / dine in now / take away ==> radio -->
                             <h5 class="text-secondary mt-5 text-center">Order Type</h5>
                             <div class="d-flex justify-content-center mt-4">
                                 <div class="form-check form-check-inline">
                                     <input value="dineIn" class="form-check-input @error('type') is-invalid @enderror h5" type="radio" name="type" id="dineInRadio">
                                     <label class="form-check-label" for="dineInRadio">
                                         Dine In
                                     </label>
                                 </div>
                                 <div class="form-check form-check-inline">
                                     <input value="takeAway" class="form-check-input @error('type') is-invalid @enderror h5" type="radio" name="type" id="takeAwayRadio">
                                     <label class="form-check-label" for="takeAwayRadio">
                                         Take Away 
                                     </label>
                                     @error('type')
                                         <span class="invalid-feedback" role="alert">
                                             <strong>{{ $message }}</strong>
                                         </span>
                                     @enderror
                                 </div>
                             </div>
                                                         <!-- perhaps add a confirmation during checkout process - like a popup or smtg -->
                             <button type="submit" class="primary-btn mt-5 w-100">Checkout</button>
                         </form>
                         <!-- CHECKOUT END -->
                     </div>
                 </div>
             </div>
         @else
             <div class="d-flex justify-content-center">
                 <div class="col-md-4 col-8">
                     <div class="col-12 mt-5 d-flex align-items-baseline">
                         <div class="col-2 px-2">
                             <img src="/images/cart.svg" alt="cart" class="img-fluid">
                         </div>
                         <div class="col-10">
                             <h4 class="m-3">Empty Cart</h4>
                         </div>
                     </div>
                     <div class="col-12 mt-5">
                         <p class="h5">Your cart is empty currently. <span><a href="{{ route('menu') }}" class="h5"><u>Add item now</u></a></span></p>
                     </div>
                     <div class="col-12 mt-4">
                         <a href="{{ route('menu') }}"><button class="primary-btn w-100 py-2">See Menu</button></a>
                     </div>
                 </div>
             </div>
         @endif
     </div>
 </section>
 @endsection