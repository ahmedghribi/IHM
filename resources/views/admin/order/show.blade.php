@extends('admin.layouts.admin')
@section('content')
<div class="card">
  <h5 class="card-header">Order</h5>
  <div class="card-body">
    @if($order)
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <th scope="col">Commande</th>
          <th scope="col">Statut</th>
          <th scope="col">Paiement</th>
          <th scope="col">Quantité</th>
          <th scope="col">Prix</th>
          <th scope="col">Action</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>{{$order->order_number}}</td>
          <td>{{$order->status}}</td>
          <td>{{$order->payment->status}}</td>
          <td>{{Helper::orderCount($order->id, $order->user->id)}}</td>
          <td>{{Helper::grandPrice($order->id, $order->user->id)}}{{Helper::base_currency()}}</td>
          <td>
            <a class="btn btn-primary" href="{{ route('admin.product.order.pdf', $order->id )}}">Pdf</a>
            <a class="btn btn-warning" href="{{ route('admin.product.order.edit', $order->id )}}">Modifier</a>
            <a class="btn btn-danger" href="{{ route('admin.product.order.destroy', $order->id )}}">Supprimer</a>
          </td>
        </tr>
      </tbody>
    </table>

    <section class="confirmation_part section_padding">
      <div class="order_boxes">
        <div class="row">
          <div class="col-lg-12">
            <div class="confirmation_tittle">
              {{-- <span>Merci. Votre Commande est reçue.</span> --}}
            </div>
          </div>
          <div class="col-lg-6 col-lx-4">
            <div class="single_confirmation_details">
              <h4>Information de la commande</h4>
              <ul>
                <li>
                  <p>Numero de la commande</p><span>: {{$order->order_number}}</span>
                </li>
                <li>
                  <p>Données</p><span>: {{$order->updated_at}}</span>
                </li>
                <li>
                  <p>total</p><span>: {{Helper::grandPrice($order->id, $order->user->id)}}{{Helper::base_currency()}} </span>
                </li>
                <li>
                  <p>Méthode de paiement</p><span>: {{$order->payment->payment_method}}</span>
                </li>
                @if($order->payment->payment_method === 'bKash' || $order->payment->payment_method === 'rocket')
                  <li>
                    <p>ID de transaction</p><span>: {{$order->payment->transection_id}}</span>
                  </li>
                @endif
                <li>
                  <p>Statut de paiement</p><span>: {{$order->payment->status}}</span>
                </li>
              </ul>
            </div>


          </div>

          <div class="col-lg-6 col-lx-4">
            <div class="single_confirmation_details">
              <h4>Adresse de Livraison</h4>
              <ul>
                <li>
                  <p>Nom</p><span>: {{$order->first_name}} {{$order->last_name}}</span>
                </li>
                <li>
                  <p>Adresse</p><span>: {{$order->address}}</span>
                </li>
                <li>
                  <p>Région</p><span>: {{App\City::findById($order->city_id)->name}}</span>
                </li>
                <li>
                  <p>Pays</p><span>: {{$order->country}}</span>
                </li>
                <li>
                  <p>Code Postal</p><span>: {{$order->post_code}}</span>
                </li>
                <li>
                  <p>Numero de Téléphone</p><span>: {{$order->phone_number}}</span>
                </li>
                <li>
                  <p>Email</p><span class="email">: {{ $order->user->email }}</span>
                </li>
              </ul>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-12">
            <div class="order_details_iner">
              <h3>Détails de la commande</h3>
              <table class="table table-borderless">
                <thead>
                  <tr>
                    <th scope="col" class="col-5">Produit</th>
                    <th scope="col" class="col-4">Quantité</th>
                    <th scope="col" class="col-3">Total</th>
                  </tr>
                </thead>
                <tbody>

                @foreach($order->cart as $cart)
                  <tr>
                    <td><span>{{$cart->product->title}}</span></td>
                    <td>x{{$cart->quantity}}</td>
                    <td><span>{{$cart->price}}{{Helper::base_currency()}}</span></td>
                  </tr>
                @endforeach
                  <tr>
                    <th></th>
                    <th>Sous-Total</th>
                    <th><span>{{Helper::orderPrice($order->id, $order->user->id)}}{{Helper::base_currency()}}</span></th>
                  </tr>
                  @if(!empty($order->coupon))
                  <tr>
                    <th></th>
                    <th>Remise</th>
                    <th><span>-{{$order->coupon->discount(Helper::orderPrice($order->id, $order->user->id))}}{{Helper::base_currency()}}</span></th>
                  </tr>                 
                  @endif


                  <tr>
                    <th></th>
                    <th>Livraison</th>
                    <th>{{$order->shipping->price}}{{Helper::base_currency()}}</span></th>
                  </tr>
                </tbody>
                <tfoot>
                  <tr>
                    <th></th>
                    <th scope="col">Total:</th>
                    <th scope="col">
                      @if(!empty($order->coupon)) 
                        {{Helper::grandPrice($order->id, $order->user->id)-($order->coupon->discount(Helper::orderPrice($order->id, $order->user->id)))}}{{Helper::base_currency()}}
                      @else
                        {{Helper::grandPrice($order->id, $order->user->id)}}{{Helper::base_currency()}}
                      @endif
                    </th>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>
        </div>
      </div>
    </section>
    @endif

  </div>
</div>
@endsection