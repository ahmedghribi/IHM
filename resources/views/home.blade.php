@extends('layouts.app')
@section('title')
  Shop || home
@endsection
@section('content')
@push('styles')
<style>

</style>
@endpush
<!--================Home Banner Area =================-->
<div id="slider">
  <p class="control_next"><i class="fa fa-angle-right"></i></p>
  <p class="control_prev"><i class="fa fa-angle-left"></i></p>
  <ul>
  @foreach($sliders as $slider)
		<li class="slide{{$slider->id}}">
			<div class="slider-title-wrapper">
				<h3 class="slider-title"><span class="slider-title-h3">
  {{$slider->title}}</span>
        <!--span class="slider-subtitle">This is the first slide</span--></h3>
			</div>
			<img src="{{asset('images/slider/'.$slider->image)}}" alt="">
		</li>
  @endforeach
	 </ul>
</div>
<!--================End Home Banner Area =================-->
<!--================ New Product Area =================-->
<section class="new_product_area section_gap_bottom_custom">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-12">
        <div class="main_title">
          <h2><span>Nouveau produits</span></h2>
          <!--p>Bring called seed first of third give itself now ment</p-->
        </div>
      </div>
    </div>
    <div class="cont">
    <div class="row"> 
      @foreach(Helper::recentProduct() as $product)
      <div class="col-md-4">    <div class="card">
      <div class="imgBx">
        <img class="image" src="{{asset('images/product/'.$product->images[0]->image)}}">
      </div>
      <div class="contentBx">
        <h2>{{$product->title}}</h2>
        <div class="size">
          <h3>Prix : {{$product->price}} TND</h3>
         
         
        </div>
      
        <a href="#">Buy Now</a>
      </div>
    </div></div>
      @endforeach
    </div>
    </div>
  </div>
</section>




<!-- Start feature Area -->
<section class="feature-area section_gap_bottom_custom">
  <div class="container">
    <div class="row">

    @foreach(Helper::get_widget('feature') as $feature)
      {!!$feature->content!!}
    @endforeach

    </div>
  </div>
</section>
<!-- End feature Area -->

<!--================ Feature Product Area =================-->
<section class="feature_product_area section_gap_bottom_custom">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-12">
        <div class="main_title">
          <h2><span>Produit en Vedette</span></h2>
        </div>
      </div>
    </div>
    <div class="row">
      @foreach($products as $product)
        @include('layouts.product', ['product' => $product, 'size' => 'thumb', 'col' => 4])
      @endforeach
    </div>
  </div>
</section>
<!--================ End Feature Product Area =================-->



<!--================ Inspired Product Area =================-->
<section class="inspired_product_area section_gap_bottom_custom">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-12">
        <div class="main_title">
          <h2><span>Inspired products</span></h2>

        </div>
      </div>
    </div>

    <div class="row">
      @foreach(Helper::inspireProduct() as $product)
        @include('layouts.product', ['product' => $product, 'size' => 'medium', 'col' => 3])
      @endforeach
    </div>
  </div>
</section>
<!--================ End Inspired Product Area =================-->

<!--================ Start Blog Area =================-->
<section class="blog-area section-gap">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-12">
        <div class="main_title">
          <h2><span>Articles</span></h2>

        </div>
      </div>
    </div>

    <div class="row">
      @foreach($posts as $post)
      <div class="col-lg-4 col-md-6">
        <div class="single-blog">
          <div class="thumb">
            @if($post->image)
              <img class="img-fluid" src="{{asset('images/post/thumb/'.$post->image)}}" alt="{{$post->title}}">
            @endif
          </div>
          <div class="short_details">
            <div class="meta-top d-flex">
              <a href="{{route('post.user', $post->user->id)}}">By {{$post->user->name}}</a>
              <a href="{{route('post.single', $post->slug)}}#comments-area"><i class="ti-comments-smiley"></i>{{count($post->allComments)}} Comments</a>
            </div>
            <a class="d-block" href="{{route('post.single', $post->slug)}}">
              <h4>{{$post->title}}</h4>
            </a>
            <div class="text-wrap">
              {{Str::words(strip_tags($post->body),16)}}
            </div>
            <a href="{{route('post.single', $post->slug)}}" class="blog_btn">Savoir plus <span class="ml-2 ti-arrow-right"></span></a>
          </div>
        </div>
      </div>
      @endforeach
    </div>
  </div>
</section>
<!--================ End Blog Area =================-->
@endsection
@push('scripts')
<script type="text/javascript">
jQuery(document).ready(function ($) {

  // This is for the auto sliding
  setInterval(function () {
      moveRight();
  }, 9000);

  //variables
  var slideCount = $('#slider ul li').length;
  var slideWidth = $('#slider ul li').width();
  var slideHeight = $('#slider ul li').height();
  var sliderUlWidth = slideCount * slideWidth;

  $('#slider').css({ width: slideWidth, height: slideHeight });

  $('#slider ul').css({ width: sliderUlWidth, marginLeft: - slideWidth });

  $('#slider ul li:last-child').prependTo('#slider ul');

  function moveLeft() {
      $('#slider ul').animate({
          left: + slideWidth
      }, 300, function () {
          $('#slider ul li:last-child').prependTo('#slider ul');
          $('#slider ul').css('left', '');
      });
  };

  function moveRight() {
      $('#slider ul').animate({
          left: - slideWidth
      }, 300, function () {
          $('#slider ul li:first-child').appendTo('#slider ul');
          $('#slider ul').css('left', '');
      });
  };

  $('.control_prev').click(function () {
      moveLeft();
  });

  $('.control_next').click(function () {
      moveRight();
  });

});
</script>
@endpush
