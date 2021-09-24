</script>
@include('web_layouts.innerheader')
<?php     
    $userdetails  = DB::table('users')->where('id', Session::get('gorgID'))->first();
    $maxProductPrice  = DB::table('product')->max('price');    
    $minmProductPrice  = DB::table('product')->min('price');
    $clientwallet = DB::table('wallet_transaction')->where('client_id', Session::get('gorgID'))->orderBy('id', 'DESC')->first();
?>
<input type="hidden" name="avalbln" id="avalbln" value="{{$clientwallet->available_balance ?? '0'}}">
<input type="hidden" name="baseurlindex" id="baseurlindex" value="{{URL('/')}}">
<!-- dashboard-section-start-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="shortcut icon" href="https://watchmarketpro.com/public/web_assets/images/favwatch.png" type="image/x-icon">  

<section class="dashboard_main">
   <div class="container container1">
      <!-- let container-fluid for max-width designs -->
      <div class="row">
         <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="row nomargin">
               <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" id="myID">
                  <div class="row">
                     <form class="form_outer mdt0 search_dashboard col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                           <div class="form-group searchicon col-lg-10 col-md-10 col-sm-10 col-xs-10 dashboard_search_bar">
                              <input type="text" class="form-control" id="search" placeholder="Search for Id, Model, Features, Year..." name="search"/>
                           </div>
                           <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 dashboard_filter">
                              <div class="row">
                                 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-right">
                                    <div class="filter_img">
                                       <a href="#" data-toggle="modal" data-target="#myModal3">
                                          <img src="{{ asset('public/web_assets/images/filter.png')}}"/>
                                       </a>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </form>
                     <?php //print_r($clientwallet);die; ?>
                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 grid-margin stretch-card">
                        <div class="card">
                           <div class="card-body">
                              <div class="table-responsive table-responsive1">
                                 <table class="table table1 setresponsive cursor" id="myTable">
                                    <thead>
                                        <tr>
                                            <th>@lang('general.brand')</th>
                                            <th>@lang('general.idno')</th>
                                            <th>@lang('general.model')</th>
                                            <th>@lang('general.year')</th>
                                            <!--<th>Features</th>-->
                                            <th>@lang('general.pct')</th>
                                            <th>@lang('general.price')</th>
                                            <th class="text-right">
                                                <button  class="increase">
                                                    <img id="expand_img" onclick="myFunction()"  src="{{ asset('public/web_assets/images/extend.png') }}" width="25px"/>
                                                    <img id="expand_img2" onclick="myFunctionblock()" style="display:none;" src="{{ asset('public/web_assets/images/collapse.png') }}" width="25px"/>
                                                </button>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($product as $data)
                                        <?php
                                            $brand = DB::table('brand')->where('id', $data->brand_id)->first();
                                            $features = explode(",", $data->features); 
                                            if(isset($brand->logo))
                                            {
                                                $logo = $brand->logo;
                                            }
                                            else{
                                                $logo='';
                                            }
                                        ?>
                                        <tr data-toggle="modal" data-id="1" data-target="#myModal1">
                                            <td><a href="#"><img src="{{ asset('public/brand_image/') }}/{{ $logo }}"/ 
                                            width="30px"></a></td>
                                            <td>{{ $data->id_no }}</td>                                         
                                            <td>{{ $data->model_name }}</td>
                                            <td>{{ $data->year }}</td>
                                            <td>{{ $data->percentage }}</td>
                                            <td>$ {{ $data->price }}</td>
                                            <td class="text-right">
                                            <a class="btn buy_btn" onclick="product_details({{$data->id}})" href="#" style="width: 62px !important;">@lang('general.viewdetails')</a>
                                            </td>
                                        </tr>   
                                        
                                       @endforeach 
                                    </tbody>
                                 </table>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" id="fullwidthsection">
                  <div class="row">
                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 grid-margin stretch-card"  id="myID1">
                        <div class="card">
                           <div class="card-body">
                              <div class="table-responsive table-responsive2  table-container" id="fullheight1">
                                 <table class="table cursor">
                                    <thead>
                                        <tr>
                                            <th colspan="3">@lang('general.insafe')</th>
                                            <th class="text-right">
                                            <button  class="increase">
                                                <img id="expand_img5" onclick="myFunction1()"  src="{{ asset('public/web_assets/images/extend.png') }}" width="25px"/>
                                                <img id="expand_img6" onclick="myFunctionblock1()" style="display:none;" src="{{ asset('public/web_assets/images/collapse.png') }}" width="25px"/>
                                            </button>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $brand = DB::table('issafe')->where('user_id', $userdetails->id)->get(); ?>
                                        @foreach($brand as $br)
                                        <?php
                                            $watch = DB::table('product')->where('id', $br->watch_id)->first();
                                            $brand = DB::table('brand')->where('id', $watch->brand_id)->first();
                                           // echo "<pre>";print_r($brand->logo);die;
                                         ?>
                                        <tr data-toggle="modal" data-id="1" data-target="#myModal2">
                                            <td><a href="#"><img src="{{ asset('public/brand_image/') }}/{{ $brand->logo}}"/ 
                                            width="30px"></a></td>
                                            <td colspan="2">
                                                <p>{{$watch->id_no}}</p>
                                                <span>{{$watch->model_name}}</span>
                                                <!-- <p>#0000205</p> -->
                                            </td>
                                        <td class="text-right"><button class="btn buy_btn" onclick="saveonsale('{{$br->watch_id}}','{{$userdetails->id}}','{{$br->id}}');">@lang('general.sell')</button>
                                        <a class="cancel" onclick="product_details_issafe({{$br->watch_id}})">@lang('general.details')</a>
                                        </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                 </table>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 grid-margin stretch-card"  id="myID3">
                        <div class="card">
                           <div class="card-body">
                              <div class="table-responsive table-responsive2" id="fullheight">
                                 <table class="table">
                                    <thead>
                                       <tr>
                                          <th colspan="3">@lang('general.marketplace')</th>
                                          <th class="text-right">
                                             <button  class="increase">
                                             <img id="expand_img7" onclick="myFunction3()"  src="{{ asset('public/web_assets/images/extend.png') }}" width="25px"/>
                                             <img id="expand_img8" onclick="myFunctionblock3()" style="display:none;" src="{{ asset('public/web_assets/images/collapse.png') }}" width="25px"/>
                                             </button>
                                          </th>
                                       </tr>
                                    </thead>
                                    <tbody>
                                        <?php $brand = DB::table('marketplace')->where('user_id', $userdetails->id)->get(); ?>
                                        @foreach($brand as $br)
                                        <?php                                            
                                            $watch = DB::table('product')->where('id', $br->watch_id)->first();
                                            $brand = DB::table('brand')->where('id', $watch->brand_id)->first();
                                            $offer = DB::table('offer')->where('watch_id', $br->watch_id)->count();
                                        ?>
                                        <tr>
                                            <td><a href="#"><img src="{{ asset('public/brand_image/') }}/{{ $brand->logo}}" width="30px"></a></td>
                                            <td colspan="2">
                                                <p>{{$watch->id_no}}</p>
                                                <span>{{$watch->model_name}}</span>
                                            </td>
                                            <td class="text-right">
                                            <button class="btn buy_btn" onclick="forMarketpace('{{$watch->id}}');">{{$offer}}-@lang('general.offer')</button>
                                                <a  style="cursor:pointer;" onclick="updateStatus('<?php echo $watch->id;?>','2','<?php echo $br->id;?>')" class="cancel">@lang('general.cancel')</a>
                                                
                                            </td>
                                        </tr>
                                        @endforeach                                       
                                    </tbody>
                                 </table>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" id="myID2">
                  <div class="row">
                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 grid-margin stretch-card fullwidthtable">
                        <div class="card">
                           <div class="card-body">
                              <div class="table-responsive" style="height: auto;">
                                 <table class="table">
                                    <thead class="fullwidth">
                                        <tr>
                                            <th colspan="3">@lang('general.transactions')</th>
                                            <th class="text-right">
                                            <button  class="increase">
                                            <img id="expand_img3" onclick="myFunction2()"  src="{{ asset('public/web_assets/images/extend.png') }}" width="25px"/>
                                            <img id="expand_img4" onclick="myFunctionblock2()" style="display:none;" src="{{ asset('public/web_assets/images/collapse.png') }}" width="25px"/>
                                            </button>
                                            </th>
                                        </tr>
                                    </thead>
                                 </table>
                                 <section id="tabs" class="project-tab">
                                    <div class="col-md-12 nopadding">
                                       <nav>
                                          <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                             <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">@lang('general.money')</a>
                                             <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">@lang('general.watch')</a>
                                          </div>
                                       </nav>
                                       <div class="tab-content" id="nav-tabContent">
                                          <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                             <div class="table-responsive table-responsive3">
                                                <table class="table" cellspacing="0">
                                                   <?php $Transactions = DB::table('wallet_transaction')->where('client_id', Session::get('gorgID'))->orderBy('id', 'DESC')->get(); ?>
                                                   <tbody>
                                                      @foreach($Transactions as $transData)
                                                      @if($transData->cr_dr_status == 1)
                                                      <tr>
                                                         <td colspan="2">
                                                            <span>
                                                               <p>Txn. ID : <b>{{ $transData->trans_id }}</b></p>
                                                               <p>Money/Debit/NEFT</p>
                                                            </span>
                                                         </td>
                                                         <td>
                                                            <p class="negative">- $ {{ $transData->withdrawal }}</p>
                                                            <span>{{ date('d-M-Y g:s a', strtotime($transData->date)) }}</span>
                                                         </td>
                                                      </tr>
                                                      @elseif($transData->cr_dr_status == 0)
                                                      <tr>
                                                         <td colspan="2">
                                                            <span>
                                                               <p>Txn. ID : <b>{{ $transData->trans_id }}</b></p>
                                                               <p><p>Money/Credit/NEFT</p></p>
                                                            </span>
                                                         </td>
                                                         <td>
                                                            <p class="positive">+ $ {{ $transData->deposit }}</p>
                                                            <span>{{ date('d-M-Y g:s a', strtotime($transData->date)) }}</span>
                                                         </td>
                                                      </tr>
                                                      @endif
                                                      @endforeach
                                                   </tbody>
                                                </table>
                                             </div>
                                          </div>
                                          <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                             <div class="table-responsive table-responsive3">
                                                <table class="table" cellspacing="0">
                                                    <?php $Transactions_watch = DB::table('wallet_transaction')->where('client_id', Session::get('gorgID'))->where('payment_mode', 'watch')->orderBy('id', 'DESC')->get();?>
                                                   <tbody>
                                                       @if(!empty($Transactions_watch))
                                                        @foreach($Transactions_watch as $transData_watch)
                                                        
                                                          <tr>
                                                             <td colspan="2">
                                                                <span>
                                                                   <p>Txn. ID : <b>{{ $transData_watch->trans_id }}</b></p>
                                                                   <p>Money/Debit/NEFT</p>
                                                                </span>
                                                             </td>
                                                             <td>
                                                                <p class="negative">- $ {{$transData_watch->deposit}}</p>
                                                                <span>{{ date('d-M-Y g:s a', strtotime($transData_watch->date)) }}</span>
                                                             </td>
                                                          </tr>
                                                      @endforeach
                                                      @endif
                                                   </tbody>
                                                </table>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </section>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 grid-margin stretch-card">
                        <div class="card">
                            <?php
                                $userdetail = DB::table('users')->where('id', Session::get('gorgID'))->first();
                            ?>
                            <div class="card-body">
                                <div class="table-responsive table-responsive4">
                                    <table class="table">
                                    <thead>
                                        <tr>
                                            <th colspan="4">@lang('general.accmanager')</th>
                                        </tr>
                                    </thead>
                                    <tbody class="user_detail">
                                        <tr style="border-bottom:0px">
                                            <td colspan="1">
                                                <img src="{{ asset('public/profile_image') }}/{{ $userdetail->profile_image}}" width="80px">
                                            </td>
                                            <td colspan="2">
                                                <ul>
                                                    <li><i class="fa fa-user-circle" aria-hidden="true"></i> {{ $userdetail->name }}</li>
                                                    <li><i class="fa fa-envelope" aria-hidden="true"></i> {{ $userdetail->email }}</li>
                                                    <li><i class="fa fa-phone" aria-hidden="true"></i> {{ $userdetail->phone }}</li>
                                                </ul>
                                            </td>
                                        </tr>
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<div id="marketplace-model" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none">
   <div class="modal-dialog changepasswordmodal all_product_modal">
      <!-- Modal content-->
        <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" onclick="dismiss()"><i class="fa fa-times" aria-hidden="true"></i></button>
        </div>
        <div class="modal-body">
            <div class="">
               <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row" id="rewsponsivetable">

                        </div>
                    </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<div id="unique-model" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none">
   <div class="modal-dialog changepasswordmodal all_product_modal">
      <!-- Modal content-->
        <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" onclick="dismiss()"><i class="fa fa-times" aria-hidden="true"></i></button>
        </div>
        <div class="modal-body">
            <div class="">
               <div class="row">
                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                     <div class="row">
                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                           <div class="row nomargin product_modal">
                              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                 <div class="product_img" id="product_img">
                                 </div>
                              </div>
                           </div>
                            <div class="all_images">
                                <ul id="all_images"></ul>
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                           <div class="row product_modal nomargin">
                              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 product_description">
                                 <ul>
                                    <li id="test">
                                       <h3><img src="#"/></h3>
                                    </li>
                                    <li id="idno"></li>
                                    <li id="modal"></li>
                                    <li id="year"></li>
                                    <input type="hidden" name="user_id" id="user_id" value="{{ $userdetail->id }}">
                                    <input type="hidden" name="watch_id" id="watch_id">
                                    <li class="inlinetext">
                                        <p>                                         
                                            <a href="#" class="btn buy_btn">@lang('general.buy')</a>
                                        </p>
                                    </li>
                                 </ul>
                              </div>
                              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                 <section id="tabs" class="all_products">
                                    <div class="container">
                                       <div class="row">
                                          <div class="col-md-12 nopadding">
                                             <nav>
                                                <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                                   <a class="nav-item nav-link active" id="Description" data-toggle="tab" href="#nav-Description" role="tab" aria-controls="nav-home" aria-selected="true">@lang('general.description')</a>
                                                   <a class="nav-item nav-link" id="Features" data-toggle="tab" href="#nav-Features" role="tab" aria-controls="nav-Features" aria-selected="false">@lang('general.features')</a>
                                                </div>
                                             </nav>
                                             <div class="tab-content" id="nav-tabContent">
                                                <div class="tab-pane fade show active" id="nav-Description" role="tabpanel" aria-labelledby="Description">
                                                   <div class="table-responsive" id="watch_description">
                                                   </div>
                                                </div>
                                                <div class="tab-pane fade" id="nav-Features" role="tabpanel" aria-labelledby="Features">
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </section>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>

<div  id="myModal3" class="modal modal3 fade" role="dialog" style="padding-right: 0px;">
   <div class="modal-dialog filter-modal">
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title">@lang('general.filter')</h4>
            <button type="button" class="close" onclick="dismiss()" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i></button>
         </div>
         <div class="modal-body col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="container-fluid">
               <div class="row">
                 <!--  <form class="form_outer mdt0  col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding"> -->
                     <form  action="{{ url('filter-brand-year') }}" method="POST" id="FormValidation" enctype="multipart/form-data" class="form_outer mdt0  col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
                     @csrf
                     <div class="row label-text">
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 selectdiv">
                            <label for="selectbrand">@lang('general.shortbybrand')</label>
                                <?php $brand = DB::table('brand')->get(); ?>
                            <select class="form-control" name="brand_id">
                                <option value="0">@lang('general.search') @lang('general.brand')</option>
                                @foreach($brand as $branddata)
                                    <option value="{{$branddata->id}}">{{$branddata->brand_name}}</option>
                                @endforeach                             
                            </select>
                        </div>
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 selectdiv">
                           <label for="selectyear">@lang('general.shortbyyeay')</label>
                                <select class="form-control" name="year">
                                    <option value="0">Select Year</option>
                                    <?php
                                    for($i = 1970; $i <= 1970+50; $i++){?>
                                        <option value="<?=$i?>"><?=$i?></option>
                                    <?php }
                                    ?>
                                </select>
                        </div>
                        <div class="form-group percentage col-lg-12 col-md-12 col-sm-12 col-xs-12">
                           <label for="pricerange">Price Range</label>
                           <div slider id="slider-distance">
                              <div>
                                 <div inverse-left style="width:70%;"></div>
                                 <div inverse-right style="width:70%;"></div>
                                 <div range style="left:0%;right:0%;"></div>
                                 <span thumb style="left:0%;"></span>
                                 <span thumb style="left:100%;"></span>
                                 <div sign style="left:0%;">
                                    <span id="value">0</span>
                                 </div>
                                 <div sign style="left: 96%;">
                                    <span id="value">100</span>
                                 </div>
                              </div>
                                <input type="range" name="min_rnage" value="0" max="100" min="0" step="1" oninput="
                                    this.value=Math.min(this.value,this.parentNode.childNodes[5].value-1);
                                    let value = (this.value/parseInt(this.max))*100
                                    var children = this.parentNode.childNodes[1].childNodes;
                                    children[1].style.width=value+'%';
                                    children[5].style.left=value+'%';
                                    children[7].style.left=value+'%';children[11].style.left=value+'%';
                                    children[11].childNodes[1].innerHTML=this.value;" />
                                <input type="range" name="max_range" value="100" max="100" min="0" step="1" oninput="
                                    this.value=Math.max(this.value,this.parentNode.childNodes[3].value-(-1));
                                    let value = (this.value/parseInt(this.max))*100
                                    var children = this.parentNode.childNodes[1].childNodes;
                                    children[3].style.width=(100-value)+'%';
                                    children[5].style.right=(100-value)+'%';
                                    children[9].style.left=value+'%';children[13].style.left=value+'%';
                                    children[13].childNodes[1].innerHTML=this.value;" />
                           </div>
                           <div class="row price_range">
                              <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 text-left">
                                 <span>${{$minmProductPrice}}</span>
                              </div>
                              <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right">
                                 <span>${{$maxProductPrice}}</span>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="row text-center">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                           <div class="row">
                              <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                 <button type="button" data-dismiss="modal" class="btn big_btn1 unactive"  onclick="#">Cancel
                                 </button>   
                              </div>
                              <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                 <button type="submitbutton" class="btn big_btn1"  onclick="#">Search
                                 </button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<div id="balancefail" class="modal modal3 fade" role="dialog" style="padding-right: 0px;">
   <div class="modal-dialog filter-modal">
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title"></h4>
            <button type="button" class="close" onclick="dismiss()" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i></button>
         </div>
         <div class="modal-body col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="container-fluid">
               <div class="row">
                 <!--  <form class="form_outer mdt0  col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding"> -->
                    @csrf                                            
                    <div class="form-group percentage col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label for="pricerange"><b>You don't have enough balance to purchase this product.Please add amount into wallet.</b></label>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <a type="button" class="btn big_btn1 mywallet"  href="{{ url('wallet') }}">Add Balance</a>
                    </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<div id="balancepass" class="modal modal3 fade" role="dialog" style="padding-right: 0px;">
   <div class="modal-dialog filter-modal">
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title"></h4>
            <button type="button" class="close" onclick="dismiss()" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i></button>
         </div>
         <div class="modal-body col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="container-fluid">
               <div class="row">
                    @csrf                                            
                    <div class="form-group percentage col-lg-12 col-md-12 col-sm-12 col-xs-12">
                       <label for="pricerange"><b style="color: green;">Thank you for purchasing our product. Your support and trust in us are much appreciated.</b></label>
                    </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<!-- percentage bar design code start -->
<style>
    .mywallet
    {
        line-height: 35px;
    }
    .price_range span
    {
        color: #707070;
        font-size: 14px;
        font-weight: 600;
    }
   .price_range
   {
      padding-top: 20px;
   }
   .modal.modal3 .filter-modal .modal-content{
      margin-top: 160px;
   }

   @include('web_layouts.outerheader')
<!-- login-section-start -->
<section class="subscribe_section">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 left_bg_section">
                <div class="subscribe_bg_img">
                    <img src="{{ asset('public/web_assets/images/subscribe_bg.png') }}" width="100%" height="100%"/>
                </div>
                <div class="inner_subscribe_section">
                    <div class="white_logo text-center">
                        <img src="{{ asset('public/web_assets/images/white_logo.png') }}" width="100%"/>
                    </div>
                    <div class="subscribe_content">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec viverra luctus est, vitae rhoncus</p>
                    </div>
                    <div class="subscribe_list">
                        <ul>
                            <li><img src="{{ asset('public/web_assets/images/subscribe_tick.png')}}"/> Lorem ipsum dolor sit amet, consectetur</li>
                            <li><img src="{{ asset('public/web_assets/images/subscribe_tick.png')}}"/> Lorem ipsum dolor sit amet, consectetur</li>
                            <li><img src="{{ asset('public/web_assets/images/subscribe_tick.png')}}"/> Lorem ipsum dolor sit amet, consectetur</li>
                            <li><img src="{{ asset('public/web_assets/images/subscribe_tick.png')}}"/> Lorem ipsum dolor sit amet, consectetur</li>
                        </ul>
                    </div>
                </div>
            </div>              
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 nopadding767">
                    <div class="subscribe_form subscribe_form1 login_form">
                        <h5>@lang('general.welcome')</h5>
                        <p>@lang('general.logintext')</p>
                    <div class="row">
                        <form class="form_outer col-lg-12 col-md-12 col-sm-12 col-xs-12" method="POST" action="{{ route('login') }}" novalidate="novalidate">
                            {{csrf_field()}}
                            <div class="row">
                            <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <label for="userid">@lang('general.useremail')</label>
                                <input type="text" class="form-control" id="userid" placeholder="User Email" name="email"/>
                                <input type="hidden" name="clientid" value="4">
                            </div>
                            <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <label for="password">@lang('general.password')</label>
                                <input type="password" class="form-control" id="password" placeholder="Password" name="password">
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-check checkbox">
                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">@lang('general.remenberme')</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right outer_link">
                                        <a href="#">@lang('general.forgotpassword')?</a>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <div class="form_footer text-center">
                                <!-- <button type="button" class="btn big_btn" type="submit" onclick="location.href=''">Log In</button> -->
                                <button class="btn big_btn" type="submit">@lang('general.login')</button>
                                <ul>
                                    <li><a href="#">@lang('general.privacypolicy')</a></li>
                                    <li><a href="#" class="left_side">@lang('general.termsofuse')</a></li>
                                </ul>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- login-section-end -->
@include('web_layouts.footer')
<script>
    function gettext()
    {
        var html = "{{Config::get('app.locale')}}";
        //alert(html);
        //document.getElementById("demo").innerHTML = x;
    }
</script>
   .percentage [slider] {
       width: 100%;
       position: relative;
       height: auto;
       margin: 55px 0 10px 0;
   }
   .percentage [slider] > div {
     position: absolute;
     left: 13px;
     right: 15px;
     height: 5px;
   }
   .percentage [slider] > div > [inverse-left] {
     position: absolute;
     left: 0;
     height: 5px;
     border-radius: 10px;
     background-color: #CCC;
     margin: 0 7px;
   }
   .percentage [slider] > div > [inverse-right] {
     position: absolute;
     right: 0;
     height: 5px;
     border-radius: 10px;
     background-color: #AEAEAE;
     margin: 0 7px;
   }
   .percentage [slider] > div > [range] {
     position: absolute;
     left: 0;
     height: 5px;
     border-radius: 14px;
     background-color: #413A18;
   }
   .percentage [slider] > div > [thumb] {
     position: absolute;
     top: -7px;
     z-index: 2;
     height: 20px;
     width: 20px;
     text-align: left;
     margin-left: -11px;
     cursor: pointer;
     box-shadow: 0 3px 8px rgba(0, 0, 0, 0.4);
     background-color: #FFF;
     border-radius: 50%;
     outline: none;
     border: 2px solid #413A18;
   }
   .percentage [slider] > input[type=range] {
     position: absolute;
     pointer-events: none;
     -webkit-appearance: none;
     z-index: 3;
     height: 14px;
     top: -2px;
     width: 100%;
     opacity: 0;
   }
   .percentage div[slider] > input[type=range]:focus::-webkit-slider-runnable-track {
     background: transparent;
     border: transparent;
   }
   .percentage div[slider] > input[type=range]:focus {
     outline: none;
   }
   .percentage div[slider] > input[type=range]::-webkit-slider-thumb {
     pointer-events: all;
     width: 28px;
     height: 28px;
     border-radius: 0px;
     border: 0 none;
     background: red;
     -webkit-appearance: none;
   }
   .percentage div[slider] > input[type=range]::-ms-fill-lower {
     background: transparent;
     border: 0 none;
   }
   .percentage div[slider] > input[type=range]::-ms-fill-upper {
     background: transparent;
     border: 0 none;
   }
   .percentage div[slider] > input[type=range]::-ms-tooltip {
     display: none;
   }
   .percentage [slider] > div > [sign] {
       opacity: 1;
       position: absolute;
       margin-left: -11px;
       top: -30px;
       z-index: 3;
       background-color: transparent;
       color: #000000;
       width: auto;
       height: 28px;
       border-radius: 28px;
       -webkit-border-radius: 28px;
       align-items: center;
       -webkit-justify-content: center;
       justify-content: center;
       text-align: center;
   }     

   .percentage [slider] > div > [sign] > span {
     font-size: 12px;
     font-weight: 700;
     line-height: 28px;
   }
</style>
<!-- percentage bar design code end -->
<script>
    $(document).ready(function(){
        $("#search").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#myTable tbody tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>
<!-- dashboard-section-end-->
@include('web_layouts.footer')
<!-- code for expand and collase section on full width start -->
<style>
    .firstDiv,
    .firstDiv1,
    .firstDiv2,
    .firstDiv3,
    .firstDiv2 .fullwidthtable
    {
        width: 100% !important;
        max-width: 100% !important;
        flex: none !important;
        display: inline-block;
        position: absolute;
        left: 0;
        right: 0;
        top: 0;
        z-index: 99;
        background-color: #ffffff;
        height:100%;
    }
    .firstDiv .stretch-card .table thead,
    .firstDiv1 .stretch-card .table thead,
    .firstDiv2 .stretch-card .table thead,
    .firstDiv3 .stretch-card .table thead
    {
        width: 100% !important;
    }
    .firstDiv .stretch-card .table tbody,
    .firstDiv1 .stretch-card .table tbody,
    .firstDiv2 .stretch-card .table tbody,
    .firstDiv3 .stretch-card .table tbody
    {
        width: 100% !important;
    }
</style>
<script type="text/javascript">
   function myFunction() {
    var element = document.getElementById("myID");
    element.classList.toggle("firstDiv");
    document.getElementById("myID1").style.display="none";
    document.getElementById("myID2").style.display="none";
    document.getElementById("myID3").style.display="none";
    document.getElementById("expand_img").style.display="none";
    document.getElementById("expand_img2").style.display="block";
   }
   function myFunctionblock() {
   var element = document.getElementById("myID");
    element.classList.toggle("firstDiv");
    document.getElementById("myID1").style.display="block";
    document.getElementById("myID2").style.display="block";
    document.getElementById("myID3").style.display="block";
    document.getElementById("expand_img").style.display="block";
    document.getElementById("expand_img2").style.display="none";
   }
   function myFunction1() {
    var element = document.getElementById("myID1");
    element.classList.toggle("firstDiv1");
    document.getElementById("fullwidthsection").style.cssText = "width: 100% !important; max-width: 100% !important;flex: none !important;display: inline-block;position: absolute;left: 0;right: 0;top: 0;z-index: 99;background-color: #ffffff;height:100%;";
    document.getElementById("myID").style.display="none";
    document.getElementById("myID2").style.display="none";
    document.getElementById("myID3").style.display="none";
    document.getElementById("fullheight1").style.cssText = "height:600px !important;";
    document.getElementById("expand_img5").style.display="none";
    document.getElementById("expand_img6").style.display="block";
    document.getElementById("expand_img7").style.display="none";
    document.getElementById("expand_img8").style.display="none";
   }
   function myFunctionblock1() {
    var element = document.getElementById("myID1");
    element.classList.toggle("firstDiv1");
    document.getElementById("fullwidthsection").style.cssText = "width: auto !important; max-width: auto !important;flex: auto !important;display: inline-block;position: relative;left: 0;right: 0;top: 0;z-index: 99;background-color: #ffffff;height:auto;";
    document.getElementById("myID").style.display="block";
    document.getElementById("myID2").style.display="block";
    document.getElementById("myID3").style.display="block";
    document.getElementById("fullheight1").style.cssText = "height:342px !important;";
    document.getElementById("expand_img5").style.display="block";
    document.getElementById("expand_img6").style.display="none";
    document.getElementById("expand_img7").style.display="block";
    document.getElementById("expand_img8").style.display="none";
   }
   function myFunction2() {
    var element = document.getElementById("myID2");
    element.classList.toggle("firstDiv2");
    document.getElementById("myID1").style.display="none";
    document.getElementById("myID").style.display="none";
    document.getElementById("myID3").style.display="none";
    document.getElementById("expand_img3").style.display="none";
    document.getElementById("expand_img4").style.display="block";
   }
   function myFunctionblock2() {
    var element = document.getElementById("myID2");
    element.classList.toggle("firstDiv2");
    document.getElementById("myID1").style.display="block";
    document.getElementById("myID").style.display="block";
    document.getElementById("myID3").style.display="block";
    document.getElementById("expand_img3").style.display="block";
    document.getElementById("expand_img4").style.display="none";
   }
   function myFunction3() {
    var element = document.getElementById("myID3");
    element.classList.toggle("firstDiv3","marketwidth");
     document.getElementById("fullwidthsection").style.cssText = "width: 100% !important; max-width: 100% !important;flex: none !important;display: inline-block;display: inline-block;position: absolute;left: 0;right: 0;top: 0;z-index: 99;background-color: #ffffff;height:100%;";
     document.getElementById("fullheight").style.cssText = "height:600px !important;";
    document.getElementById("myID1").style.display="none";
    document.getElementById("myID2").style.display="none";
    document.getElementById("myID").style.display="none";
    document.getElementById("expand_img5").style.display="none";
    document.getElementById("expand_img6").style.display="none";
    document.getElementById("expand_img7").style.display="none";
    document.getElementById("expand_img8").style.display="block";
   }
   function myFunctionblock3() {
    var element = document.getElementById("myID3");
    element.classList.toggle("firstDiv3");
    document.getElementById("fullwidthsection").style.cssText = "width: auto !important; max-width: auto !important;flex: auto !important;display: inline-block;position: relative;left: 0;right: 0;top: 0;z-index: 99;background-color: #ffffff;height:auto;";
    document.getElementById("myID1").style.display="block";
    document.getElementById("myID2").style.display="block";
    document.getElementById("myID").style.display="block";
    document.getElementById("fullheight").style.cssText = "height:342px !important;";
    document.getElementById("expand_img5").style.display="block";
    document.getElementById("expand_img6").style.display="none";
    document.getElementById("expand_img7").style.display="block";
    document.getElementById("expand_img8").style.display="none";
   }
</script>
<!-- code for expand and collase section on full width End -->
<!-- Script for product details and  -->
<script type="text/javascript">
    function forMarketpace(id)
    {
        var APP_URL   = $("#baseurlindex").val();
        var productId = id;
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        
        $.ajax({   
            url:"{{url('get_marketplace_offer/')}}"+'/'+productId,
            method:"POST", 
            contentType : 'application/json',
            success: function( productdata )  {
                $('#rewsponsivetable').html(productdata);
            }
        });
        
        $.ajax({   
            url:"{{url('product-image-gallery/')}}"+'/'+productId,
            method:"POST", 
            contentType : 'application/json',
            success: function( productdata )  {
            productdata.forEach(function (image) {
                $('#all_images').append('<li><a id="slideshow" href="#"><img src="'+ APP_URL +'/public/product_image/' + image.image + '" /></a></li>');
            }); 
                $('#product_img').append('<img src="'+ APP_URL +'/public/product_image/' + productdata[0].image + '" />');
            productdata.forEach(function (image) {
            //exit;
            });               
            }
        });
        
        $.ajax({   
            url:"{{url('product-detail/')}}"+'/'+id,
            method:"POST", 
            contentType : 'application/json',
            success: function( data ) {
            console.log(data);  

                $("#watch_id").val(data.id);  
                $("#brandmarket").html(data.brand_name); 
                $("#idnomarket").html(data.id_no); 
                $("#modalmarker").html(data.model_name); 
                $("#year").html("<p>Year : <b>"+data.year+"</b></p>");
                $(".inlinetext").html("<p>Percentage : <b>"+data.percentage+"%</b></p><p><b>Current Price : <span class='positive' id='currentprice'>$ "+data.price+"</span></b></p><p><a href='#' class='btn buy_btn' onclick='checkbalance();'>Buy</a></p>");  
                $("#watch_description").html("<p>"+data.description+"</p>"); 

                var strArray = data.features.split(",");
                var feature = "";
                var i;
                for (i = 0; i < strArray.length; i++) {
                    feature += strArray[i] + "<br>";
                }
                document.getElementById("nav-Features").innerHTML = feature;
                $('#marketplace-model').modal('show'); 
            }
        });
    }  
    function product_details(id){
        
        $('#rewsponsivetable').html();
        $("#watch_id").val();  
        $("#brandmarket").html(); 
        $("#idnomarket").html(); 
        $("#modalmarker").html(); 
        $("#year").html();
        $(".inlinetext").html();
        $("#watch_description").html();
        
        var APP_URL   = $("#baseurlindex").val();
        var productId = id;
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $.ajax({   
            url:"{{url('product-image-gallery/')}}"+'/'+productId,
            method:"POST", 
            contentType : 'application/json',
            success: function( productdata )  {
            productdata.forEach(function (image) {
                $('#all_images').html('<li><a id="slideshow" href="#"><img src="'+ APP_URL +'/public/product_image/' + image.image + '" /></a></li>');
            }); 
                $('#product_img').html('<img src="'+ APP_URL +'/public/product_image/' + productdata[0].image + '" />');
            productdata.forEach(function (image) {
            //exit;
            });               
            }
        });

        $.ajax({   
            url:"{{url('product-detail/')}}"+'/'+id,
            method:"POST", 
            contentType : 'application/json',
            success: function( data ) {
            console.log(data);  
                $("#watch_id").val(data.id);  
                $("#test").html("<p>Brand : <b>"+ data.brand_name +"</b></p>"); 
                $("#idno").html("<p>ID No : <b> "+data.id_no+" </b></p>"); 
                $("#modal").html("<p>Model : <b>"+ data.model_name+"</b></p>"); 
                $("#year").html("<p>Year : <b>"+data.year+"</b></p>");
                $(".inlinetext").html("<p>Percentage : <b>"+data.percentage+"%</b></p><p><b>Current Price : <span class='positive' id='currentprice'>$ "+data.price+"</span></b></p><p><a href='#' class='btn buy_btn' onclick='checkbalance();'>Buy</a></p>");  
                $("#watch_description").html("<p>"+data.description+"</p>"); 

                var strArray = data.features.split(",");
                var feature = "";
                var i;
                for (i = 0; i < strArray.length; i++) {
                    feature += strArray[i] + "<br>";
                }
                document.getElementById("nav-Features").innerHTML = feature;
                $('#unique-model').modal('show'); 
            }
        });
    }
    function product_details_issafe(id){
        
        $('#rewsponsivetable').html();
        $("#watch_id").val();  
        $("#brandmarket").html(); 
        $("#idnomarket").html(); 
        $("#modalmarker").html(); 
        $("#year").html();
        $(".inlinetext").html();
        $("#watch_description").html();
        
        var APP_URL   = $("#baseurlindex").val();
        var productId = id;
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $.ajax({   
            url:"{{url('product-image-gallery/')}}"+'/'+productId,
            method:"POST", 
            contentType : 'application/json',
            success: function( productdata )  {
            productdata.forEach(function (image) {
                $('#all_images').html('<li><a id="slideshow" href="#"><img src="'+ APP_URL +'/public/product_image/' + image.image + '" /></a></li>');
            }); 
                $('#product_img').html('<img src="'+ APP_URL +'/public/product_image/' + productdata[0].image + '" />');
            productdata.forEach(function (image) {
            //exit;
            });               
            }
        });

        $.ajax({   
            url:"{{url('product-detail/')}}"+'/'+id,
            method:"POST", 
            contentType : 'application/json',
            success: function( data ) {
            console.log(data);  
                $("#watch_id").val(data.id);  
                $("#test").html("<p>Brand : <b>"+ data.brand_name +"</b></p>"); 
                $("#idno").html("<p>ID No : <b> "+data.id_no+" </b></p>"); 
                $("#modal").html("<p>Model : <b>"+ data.model_name+"</b></p>"); 
                $("#year").html("<p>Year : <b>"+data.year+"</b></p>");
                $(".inlinetext").html("<p>Percentage : <b>"+data.percentage+"%</b></p><p><b>Current Price : <span class='positive' id='currentprice'>$ "+data.price+"</span></b></p>");  
                $("#watch_description").html("<p>"+data.description+"</p>"); 

                var strArray = data.features.split(",");
                var feature = "";
                var i;
                for (i = 0; i < strArray.length; i++) {
                    feature += strArray[i] + "<br>";
                }
                document.getElementById("nav-Features").innerHTML = feature;
                $('#unique-model').modal('show'); 
            }
        });
    }
</script>
<!-- End product details -->

<!-- model close button reload Start-->
<script type="text/javascript">
    function dismiss()
    {
        location.reload();
        $('#balancepass').modal('hide');
        $('#balancefail').modal('hide');
    }

    function checkbalance()
    {
        var myString = $('#currentprice').text();
        var user_id  = $('#user_id').val();
        var watch_id = $('#watch_id').val();
        var avalbln  = $('#avalbln').val();
        var avoid    = "$";
        var avoided  = myString.replace(avoid,'');
        var crntbaln = $.trim(avoided);

        if(parseInt(crntbaln) <= parseInt(avalbln)){     

                $.ajax({                     
                    type: "GET", 
                    url : "{{url('add-issafe')}}", 
                    data: {'user_id':user_id, 'watch_id':watch_id,'crntbaln':crntbaln},
                    contentType : 'application/json',
                    success: function( productdata )  {
                        if(productdata){
                            $('#balancepass').modal('show');
                            $('#unique-model').modal('hide');
                        }        
                    }
                });      
                
        }   else{            
                $('#balancefail').modal('show');
                $('#unique-model').modal('hide');
        }
    }

    function saveonsale(watch_id,user_id,id)
    {        
        $.ajax({                     
            type: "GET", 
        
            
            url : "{{url('add-marketplace')}}", 
            data: {'user_id':user_id, 'watch_id':watch_id, 'id':id},
            contentType : 'application/json',
            success: function( productdata )  {
                if(productdata==1){
                    alert('Added to Marketplace.');
                    location.reload();
                }   else{
                    alert('Something went wrong.');
                    location.reload();
                }        
            }
        });           
        /*$('#balancefail').modal('show');
        $('#unique-model').modal('hide');*/       
    }

    function updateStatus(id,status,marketid=0)
    {
        $.ajax({                     
            type: "GET", 
            url :"{{url('update-status')}}",
            data: {'id':id,'status':status,'marketid':marketid},
            contentType : 'application/json',
            success: function( productdata )  {
                //alert(productdata);
                if(productdata==1){
                    alert('Offer acceped by you.');
                    location.reload();
                }else if(productdata==0){
                    alert('Offer rejected by you.');
                    //$('#hidetr'+id).fadeOut(1000);
                    location.reload();
                }else if(productdata==2)
                {
                    location.reload();
                }
            }
        });    
    }
</script>
<!-- model close button reload End-->
<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Track;
use App\Alarm_create;
use App\Templates;
use  App\User;
use DB;
use Hash;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use League\Flysystem\Filesystem;
use League\Flysystem\Adapter\Local;
use URL;

class OtpController extends Controller
{    
    // Function to generate OTP 
    public function generateNumericOTP($n) { 
    // Take a generator string which consist of 
    // all numeric digits 
    $generator = "1357902468"; 
  
    // Iterate for n-times and pick a single character 
    // from generator and append it to $result 
      
    // Login for generating a random character from generator 
    //     ---generate a random number 
    //     ---take modulus of same with length of generator (say i) 
    //     ---append the character at place (i) from generator to result 
  
    $result = ""; 
  
    for ($i = 1; $i <= $n; $i++) { 
        $result .= substr($generator, (rand()%(strlen($generator))), 1); 
    } 
  
    // Return result 
    return $result; 
} 

    public function send_otp(Request $request){
        $rules = [
            'phone' => 'required'                    
        ];

        $validator = Validator::make($request ->all(), $rules);
        if ($validator->fails()){
            return response()->json(['StatusCode' => 422,'status' => 'Failed','message'=>$validator->messages()], 200);
        } 
        else 
        {
            try {
                $otp = $this->generateNumericOTP(6);
                $msg = "Your code for otp varification ".$otp;

                // use wordwrap() if lines are longer than 70 characters
                $msg = wordwrap($msg,70);

                // send email
                //mail($request->input('email'),"Otp code from wmc",$msg);
                $id = DB::table('users_otp')->insertGetId(['otp' => $otp, 'phone' => $request->input('phone')]);
                 $data = collect(['status' => '200', "message" => "Success", "otp"=>$otp]);
                return response()->json($data, 200); 
                
            }catch (\Exception $e) {               
                return response()->json(['StatusCode' => 422, 'status' => 'Failed','message' => $e], 409);
            }
        }
    }
    
      public function varify_otp(Request $request){
        $rules = [
            //'email' => 'required',  
            'phone' => 'required',  
            'otp' => 'required'                  
        ];
        $validator = Validator::make($request ->all(), $rules);
        if ($validator->fails()){
            return response()->json(['StatusCode' => 422,'status' => 'Failed','message'=>$validator->messages() ], 200);
        } 
        else 
        {
            try 
            {
                $row = DB::table('users_otp')->where('otp',$request->input('otp'))->where('phone',$request->input('phone'))->first();
                //print_r($row);die;
                if($row!=null)
                {
                    $data = collect(["status" => 200,"message" => "otp varified", "data"=>$row]);
                    return response()->json($data, 200); 
                }
                $data = collect(["status" => 200,"message" => "Wrong code", "data"=>$row]);
                return response()->json($data, 200); 
                
            }
            catch (\Exception $e) 
            {               
                return response()->json(['status' => 422, 'status' => 'Failed','message' => $e], 409);
            }
        }
    }
    public function create_new_password_with_otp(Request $request){
        $rules = [
            'email' => 'required',  
            'otp' => 'required',
            'password'=>'required'
        ];

        $validator = Validator::make($request ->all(), $rules);
        if ($validator->fails()){
            return response()->json(['StatusCode' => 400,'status' => 'Failed','message'=>$validator->messages() ], 200);
        } 
        else 
        {
            try {
                $row = DB::table('users_otp')->where('otp','=',$request->otp)->where('email','=',$request->email)->get()->first();
                if($row!=null)
                {   
                    $enc_pass = app('hash')->make($request->password);
                    $row= DB::table('users')->where('email','=',$request->email)->update(['password'=>$enc_pass]);
                    $data = collect(["StatusCode" => 200, 'status' => 'Success', "message" => "Password updated", "data"=>$row]);
                    return response()->json($data, 200); 
                }
                $data = collect(["StatusCode" => 200, 'status' => 'Success', "message" => "Wrong code", "data"=>$row]);
                return response()->json($data, 200); 
                
            }catch (\Exception $e) {               
                return response()->json(['StatusCode' => 422, 'status' => 'Failed','message' => $e], 409);
            }
        }
    }
    
    public function otpmessages()
    {
        $apiKey = urlencode('Njg2NTU0NTE2ZDRlNGM0ZjM3Mzg0MzY0MzY0ZjRjNmY=');
        
        // Message details
        $numbers = array(917905848385);
        $sender = urlencode('TXTLCL');
        $message = rawurlencode('This is your message');
        
        $numbers = implode(',', $numbers);
        
        // Prepare data for POST request
        $data = array('apikey' => $apiKey, 'numbers' => $numbers, "sender" => $sender, "message" => $message);
        
        // Send the POST request with cURL
        $ch = curl_init('https://api.textlocal.in/send/');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $response = curl_exec($ch);
        curl_close($ch);
        print_r($response);
        // Process your response here
        //echo $response;
    }
    
}



<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    <script>
    $(document).ready(function() { 
        
        //alert(sessionStorage.getItem("price"));
        $('.selected_price').html(sessionStorage.getItem("price"));
        $('.selected_duration').text(sessionStorage.getItem("duration"));
        $('.selected_description').html(sessionStorage.getItem("description"));        
        $('#merchant_total').val(sessionStorage.getItem("merchant_total"));
        $('#plan_id').val(sessionStorage.getItem("plan_id"));
        $('#sub_time').val(sessionStorage.getItem("sub_time"));
        $('#sub_type').val(sessionStorage.getItem("sub_type"));
        
        if(sessionStorage.getItem("merchant_total")!=null)
        {
            //alert(sessionStorage.getItem("price"));
            $('#subtab2').removeClass('inactiveLink');
            $('#subtab3').removeClass('inactiveLink');
            $('#subtab1').removeClass('active');
            $('#subtab2').addClass('active');
            $('#subtab3').addClass('active');
            $('#subpills1').removeClass('show active');
            $('#subpills2').removeClass('show active');
            $('#subpills3').addClass('show active'); 

        }else{
            $('#subtab2').addClass('inactiveLink');
            $('#subtab3').addClass('inactiveLink');
            /*localStorage.removeItem("price");
            localStorage.removeItem("duration");
            localStorage.removeItem("description");
            localStorage.removeItem("merchant_total");
            localStorage.removeItem("plan_id");
            localStorage.removeItem("sub_time");
            localStorage.removeItem("sub_type"); */            
        }
        
            /*sessionStorage.getItem("price");
            sessionStorage.getItem("merchant_total");
            sessionStorage.getItem("plan_id");
            sessionStorage.getItem("sub_time");
            sessionStorage.getItem("sub_type"); 
            sessionStorage.getItem("duration"); 
            sessionStorage.getItem("description");*/
            //document.getElementById("merchant_total").innerHTML = sessionStorage.getItem("merchant_total");
    });
</script>
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    duradrive html
header('Access-Control-Allow-Origin: *');
header( 'Access-Control-Allow-Headers: Authorization, Content-Type' );
DB: watcffin_wmc
pass: 1!1#3[DI4O{l
user: watcffin_wmcuser

CREATE TABLE ``.`user_watch_history` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `movie_id` INT NULL DEFAULT '0',
  `type` VARCHAR(45) NULL DEFAULT 'null',
  `user_id` INT NULL DEFAULT '0',
  `current_position` VARCHAR(255) NULL DEFAULT 'null',
  `created_at` VARCHAR(45) NULL DEFAULT 'CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP',
  PRIMARY KEY (`id`));


ALTER TABLE ``.`user_watch_history` 
RENAME TO  ``.`digimovie_user_watch_history` ;

9935722323
anil uttam


share url ,promo url,type

Form upcomming-

banner_image_url,type(trailer,web,normal),title,title_status(upcoming),type_value

CREATE TABLE ``.`tv_users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `device_id` TEXT NOT NULL,
  `user_id` INT NULL DEFAULT '0',
  `created_at` TEXT NULL,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `otp` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

  ALTER TABLE ``.`tv_users` 
RENAME TO  ``.`tv_users_verify` ;

khamer
philipino
mendrin


1. Device id for sending random number
2. device_id,userid

1. App Settings(Notifications, App languages)
2. Privacy policy ,term and conditions, about us,contact us
3. Checkout
4. Social Login (Twitter)
5. Payment Gateway

https://1drv.ms/x/s!ArLUNTdsP7RJg1xuwnwc2DXnXhNH?e=x8uS2i

ALTER TABLE ``.`cms_pages` 
CHANGE COLUMN `value` `value` LONGTEXT NULL DEFAULT NULL ;

1. how many devices according to UserID history on web and remove
2. continue watchlist

CREATE TABLE ``.`digimovie_voucher` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `voucher_owner` VARCHAR(45) NULL DEFAULT '0',
  `voucher` TEXT NULL DEFAULT NULL,
  `voucher_user` VARCHAR(45) NULL DEFAULT '0',
  `status` VARCHAR(45) NULL DEFAULT 'inactive',
  `created_at` TEXT NULL,
  `updated_at` VARCHAR(45) NULL DEFAULT 'CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP',
PRIMARY KEY (`id`));

ALTER TABLE ``.`digimovie_voucher` 
CHANGE COLUMN `updated_at` `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ;

ALTER TABLE ``.`digimovie_voucher` 
RENAME TO  ``.`digimovie_vouchers` ;

ALTER TABLE ``.`digimovie_user_watch_history` 
CHANGE COLUMN `created_at` `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ;

ALTER TABLE ``.`payments` 
ADD COLUMN `type` VARCHAR(45) NOT NULL DEFAULT 'other' AFTER `start_date`;


ALTER TABLE ``.`sub_plan` 
ADD COLUMN `sub_description` LONGTEXT NULL AFTER `is_add_free`,
ADD COLUMN `created_at` VARCHAR(45) NULL AFTER `sub_description`,
ADD COLUMN `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `created_at`;

ALTER TABLE ``.`sub_plan` 
ADD COLUMN `plan_id` TEXT NULL AFTER `updated_at`;

    UPDATE ``.`sub_plan` SET `sub_name` = 'Platinum Plan', `sub_price` = '599', `currency_type` = 'INR', `sub_type` = 'yearly', `sub_status` = 'true', `sub_description` = 'Billed Yearly\\nUnlimited Access To HD Content', `created_at` = '2021-03-09 08:00:27', `plan_id` = 'plan_GdpV0AveS68KmM' WHERE (`sub_id` = '1');
    UPDATE ``.`sub_plan` SET `sub_name` = 'Gold Plan', `sub_price` = '249', `currency_type` = 'INR', `sub_type` = 'monthly', `sub_time` = '3', `sub_status` = 'true', `sub_description` = 'Billed Quarterly\\nUnlimited Access To HD Content', `created_at` = '2021-03-09 08:00:27', `plan_id` = 'plan_GdpTiyM0h0HDNN' WHERE (`sub_id` = '2');
    INSERT INTO ``.`sub_plan` (`sub_id`, `sub_name`, `sub_price`, `currency_type`, `sub_type`, `sub_time`, `sub_status`, `is_content`, `is_add_free`, `sub_description`, `created_at`, `updated_at`, `plan_id`) VALUES ('3', 'SIlver Plan', '99', 'INR', 'monthly', '1', 'true', '0', '0', 'Billed Monthly\\nUnlimited Access To HD Content', '2021-03-09 08:00:27', '2021-03-09 08:00:27', 'plan_GdpSCA2UXC9A1R');



CREATE TABLE ``.`sub_plan_currency` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country_code` VARCHAR(45) NULL DEFAULT 0,
  `platinum_price` VARCHAR(45) NULL DEFAULT 0,
  `gold_price` VARCHAR(45) NULL DEFAULT 0,
  `silver_price` VARCHAR(45) NULL DEFAULT 0,
  `currency_rate` VARCHAR(45) NULL DEFAULT 0,
  `country_name` VARCHAR(45) NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`));


ALTER TABLE ``.`sub_plan_currency` 
RENAME TO  ``.`country_currency` ;

ALTER TABLE ``.`country_currency` 
CHANGE COLUMN `platinum_price` `platinum_price` FLOAT NULL DEFAULT '0' ,
CHANGE COLUMN `gold_price` `gold_price` FLOAT NULL DEFAULT '0' ,
CHANGE COLUMN `silver_price` `silver_price` FLOAT NULL DEFAULT '0' ,
CHANGE COLUMN `currency_rate` `currency` VARCHAR(45) NULL DEFAULT '0' ;



ALTER TABLE ``.`payments` 
ADD COLUMN `currency` VARCHAR(45) NULL AFTER `type`,
ADD COLUMN `country_name` VARCHAR(45) NULL AFTER `currency`;

================================================================
ALTER TABLE ``.`videos` 
ADD INDEX `user_id` (`user_id` ASC) VISIBLE;
;

ALTER TABLE ``.`videos` 
ADD INDEX `privacy_type and video_rank` (`video_rank` ASC, `privacy_type` ASC) INVISIBLE;
;

ALTER TABLE ``.`user_watchlist` 
ADD INDEX `user_id` (`user_id` ASC) INVISIBLE;
;

ALTER TABLE ``.`video_like_dislike`
ADD INDEX `video_id and user_id` (`video_id` ASC, `user_id` ASC) VISIBLE;
;

ALTER TABLE ``.`follow_users` 
ADD INDEX `user_id and followed_user_id` (`followed_fb_id` ASC, `user_id` ASC) VISIBLE;
;

ALTER TABLE ``.`follow_users` 
ADD INDEX `user_id` (`user_id` ASC) INVISIBLE,
ADD INDEX `followed_user_id` (`followed_user_id` ASC) VISIBLE;
;

ALTER TABLE ``.`video_comment` 
ADD INDEX `video_id` (`video_id` ASC) INVISIBLE,
ADD INDEX `video_id and is_deleted and parent_id` (`video_id` ASC, `is_deleted` ASC, `parent_id` ASC) VISIBLE;
;

==============================
#ALTER TABLE ``.`videos` 
#DROP COLUMN `videoscol`;

=======================================================================================================================================
<link rel='stylesheet' type='text/css' href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"/>
<div class="languages">
    <form>-->
        <!--<div id="google_translate_element"></div>-->
        <!-- <div class="form-group">
            
            <a href="{{ url('locale/en') }}" ><i class="fa fa-language"></i> EN</a>
            <a href="{{ url('locale/fr') }}" ><i class="fa fa-language"></i> FR</a>
            <select class="form-control">
                <option>EN</option>
                <option>FR</option>
            </select>
        </div> -->
    <!--</form>
</div>

<!--<script type="text/javascript" src="{{ asset('public/web_assets/js/multiplelanguage.js') }}"></script>-->
<script type="text/javascript">
    /*function googleTranslateElementInit() {
      new google.translate.TranslateElement({pageLanguage: 'ja', layout: google.translate.TranslateElement.InlineLayout.SIMPLE,includedLanguages: "en,fr"
    }, 'google_translate_element');
    }*/
</script>
*/5 * * * * /bin/php  /var/www/html/application/controllers/Api/recurring_payment

*/5 * * * * /bin/php  http://13.232.106.185/Api/recurring_payment

================================
CREATE TABLE ``.`user_login_history` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `device_id` VARCHAR(255) NULL,
  `is_watching` VARCHAR(45) NOT NULL DEFAULT 'false',
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));


ALTER TABLE ``.`user_login_history` 
CHANGE COLUMN `id` `id` INT NOT NULL AUTO_INCREMENT ;


CREATE TABLE ``.`ios_app_notification` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `auto_renew_adam_id` VARCHAR(255) NULL,
  `auto_renew_product_id` VARCHAR(255) NULL,
  `auto_renew_status` VARCHAR(255) NULL,
  `auto_renew_status_change_date` VARCHAR(255) NULL,
  `auto_renew_status_change_date_ms` VARCHAR(255) NULL,
  `auto_renew_status_change_date_pst` VARCHAR(255) NULL,
  `environment` VARCHAR(255) NULL,
  `expiration_intent` VARCHAR(255) NULL,
  `notification_type` VARCHAR(255) NULL,
  `password` VARCHAR(255) NULL,
  `unified_receipt` LONGTEXT NULL,
  `bid` VARCHAR(255) NULL,
  `bvrs` VARCHAR(255) NULL,
  `latest_receipt` LONGTEXT NULL,
  `latest_expired_receipt` VARCHAR(255) NULL,
  `latest_expired_receipt_info` VARCHAR(255) NULL,
  PRIMARY KEY (`id`));


arknewte_duradri
ve_new
arknewte_duradrive_new
didPdw(nt1M(

<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/site/new_version/css/custom.css">
8865812932

    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}
<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}
<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
    public function view_foodmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}
<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}
<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}
<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}
<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}
<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_shopmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.shopmerchant.edit_shopmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_operatormanager($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.operatormanager.edit_operatormanager';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_driver($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.driver.edit_driver';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
}

<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Session;
use Response;
use App\User;
use DB;
use Hash;
use Auth;

class DriverController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function filter_manager(Request $request){
    try {
      $manager = DB::table('users')->where('users_role', 3)->where('upload_by', $request->whitelabel_id)->get();
      $data['content'] = 'admin.manager.manage_manager';
      return view('layouts.content', compact('data'))->with(['manager' => $manager, 'whitelabel_id'=> $request->whitelabel_id]);
    } catch (Throwable $e) {
        report($e);
        return false;
    }
  }

  public function add_service(Request $request){
    
    if($files = $request->image){
      /*$destinationPath = public_path('/profile_image/');
      $profileImage = date('YmdHis') . "-" . $files->getClientOriginalName();
      $path =  $files->move($destinationPath, $profileImage);
      $image = $insert['photo'] = "$profileImage";*/
    }
      $data = array(
        'name' => $request->name,  
        'upload_by' => $uploadBy,  
        'users_role' => 3,  
        'email' => $request->email, 
        'phone' => $request->phone, 
        'address' => $request->address, 
        'country_id' => $request->country_id, 
        'dob' => $request->dob, 
        'gender' => $request->gender, 
        'password' => Hash::make($request->password), 
        'profile_image' =>  $image, 
        'created_at' => date('Y-m-d H:i:s'),
      );
      Session::flash('success','Inserted successfully..!');
      $insertData = DB::table('users')->insert($data);
      return redirect('view-countrym');
  }

  public function view_service()
  {
    if(Session::get('userRole') == 1){
      $manager = User::where('users_role', 3)->get();
    }else{
      $manager = User::where('upload_by', Session::get('gorgID'))->where('users_role', 3)->get();
    }   

    /*$status = User::isOnline($manager->id);

    print_r($status); die;*/

    $data['content'] = 'admin.service.manage_service';
    return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }
  
  public function view_foodmerchant()
  {
      $manager = User::where('users_role', 3)->get();
      $data['content'] = 'admin.foodmerchant.manage_foodmerchant';
      return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
  }

    public function view_operatormanager()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.operatormanager.manage_operatormanager';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_shopmerchant()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.shopmerchant.manage_shopmerchant';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_driver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.manage_driver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function signupdriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.signupdriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function registereddriver()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.registereddriver';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function pendingapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.pendingapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function incompleteddoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.incompleteddoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function rejectedapp()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.rejectedapp';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function expirydoc()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.driver.expirydoc';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_vehicle()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.vehicle.manage_vehicle';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_drivermap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.driver_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    public function view_heatmap()
    {
        $manager = User::where('users_role', 3)->get();
        $data['content'] = 'admin.map.heat_map';
        return view('layouts.content', compact('data'))->with(['manager' => $manager ]);
    }
    
    public function edit_service($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.service.edit_service';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    public function edit_vehicle($id)
    {
        $editmanager = User::where('id', $id)->first();
        $data['content'] = 'admin.vehicle.view_vehicle';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
    
    public function edit_foodmerchant($id)
    {
        $editmanager = User::where('id', $id)->first();
        /*print_r($editmanager); die;*/        $data['content'] = 'admin.foodmerchant.edit_foodmerchant';
        return view('layouts.content', compact('data'))->with(['editmanager' => $editmanager ]);
    }
<section class="dashboard_main">
   <div class="container container1">
      <!-- let container-fluid for max-width designs -->
      <div class="row">
         <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="row nomargin">
               <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" id="myID">
                  <div class="row">
                     <form class="form_outer mdt0 search_dashboard col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                           <div class="form-group searchicon col-lg-10 col-md-10 col-sm-10 col-xs-10 dashboard_search_bar">
                              <input type="text" class="form-control" id="search" placeholder="Search for Id, Model, Features, Year..." name="search"/>
                           </div>
                           <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 dashboard_filter">
                              <div class="row">
                                 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-right">
                                    <div class="filter_img">
                                       <a href="#" data-toggle="modal" data-target="#myModal3">
                                          <img src="{{ asset('public/web_assets/images/filter.png')}}"/>
                                       </a>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </form>
                     <?php //print_r($clientwallet);die; ?>
                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 grid-margin stretch-card">
                        <div class="card">
                           <div class="card-body">
                              <div class="table-responsive table-responsive1">
                                 <table class="table table1 setresponsive cursor" id="myTable">
                                    <thead>
                                        <tr>
                                            <th>@lang('general.brand')</th>
                                            <th>@lang('general.idno')</th>
                                            <th>@lang('general.model')</th>
                                            <th>@lang('general.year')</th>
                                            <!--<th>Features</th>-->
                                            <th>@lang('general.pct')</th>
                                            <th>@lang('general.price')</th>
                                            <th class="text-right">
                                                <button  class="increase">
                                                    <img id="expand_img" onclick="myFunction()"  src="{{ asset('public/web_assets/images/extend.png') }}" width="25px"/>
                                                    <img id="expand_img2" onclick="myFunctionblock()" style="display:none;" src="{{ asset('public/web_assets/images/collapse.png') }}" width="25px"/>
                                                </button>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($product as $data)
                                        <?php
                                            $brand = DB::table('brand')->where('id', $data->brand_id)->first();
                                            $features = explode(",", $data->features); 
                                            if(isset($brand->logo))
                                            {
                                                $logo = $brand->logo;
                                            }
                                            else{
                                                $logo='';
                                            }
                                        ?>
                                        <tr data-toggle="modal" data-id="1" data-target="#myModal1">
                                            <td><a href="#"><img src="{{ asset('public/brand_image/') }}/{{ $logo }}"/ 
                                            width="30px"></a></td>
                                            <td>{{ $data->id_no }}</td>                                         
                                            <td>{{ $data->model_name }}</td>
                                            <td>{{ $data->year }}</td>
                                            <td>{{ $data->percentage }}</td>
                                            <td>$ {{ $data->price }}</td>
                                            <td class="text-right">
                                            <a class="btn buy_btn" onclick="product_details({{$data->id}})" href="#" style="width: 62px !important;">@lang('general.viewdetails')</a>
                                            </td>
                                        </tr>   
                                        
                                       @endforeach 
                                    </tbody>
                                 </table>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" id="fullwidthsection">
                  <div class="row">
                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 grid-margin stretch-card"  id="myID1">
                        <div class="card">
                           <div class="card-body">
                              <div class="table-responsive table-responsive2  table-container" id="fullheight1">
                                 <table class="table cursor">
                                    <thead>
                                        <tr>
                                            <th colspan="3">@lang('general.insafe')</th>
                                            <th class="text-right">
                                            <button  class="increase">
                                                <img id="expand_img5" onclick="myFunction1()"  src="{{ asset('public/web_assets/images/extend.png') }}" width="25px"/>
                                                <img id="expand_img6" onclick="myFunctionblock1()" style="display:none;" src="{{ asset('public/web_assets/images/collapse.png') }}" width="25px"/>
                                            </button>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $brand = DB::table('issafe')->where('user_id', $userdetails->id)->get(); ?>
                                        @foreach($brand as $br)
                                        <?php
                                            $watch = DB::table('product')->where('id', $br->watch_id)->first();
                                            $brand = DB::table('brand')->where('id', $watch->brand_id)->first();
                                           // echo "<pre>";print_r($brand->logo);die;
                                         ?>
                                        <tr data-toggle="modal" data-id="1" data-target="#myModal2">
                                            <td><a href="#"><img src="{{ asset('public/brand_image/') }}/{{ $brand->logo}}"/ 
                                            width="30px"></a></td>
                                            <td colspan="2">
                                                <p>{{$watch->id_no}}</p>
                                                <span>{{$watch->model_name}}</span>
                                                <!-- <p>#0000205</p> -->
                                            </td>
                                        <td class="text-right"><button class="btn buy_btn" onclick="saveonsale('{{$br->watch_id}}','{{$userdetails->id}}','{{$br->id}}');">@lang('general.sell')</button>
                                        <a class="cancel" onclick="product_details_issafe({{$br->watch_id}})">@lang('general.details')</a>
                                        </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                 </table>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 grid-margin stretch-card"  id="myID3">
                        <div class="card">
                           <div class="card-body">
                              <div class="table-responsive table-responsive2" id="fullheight">
                                 <table class="table">
                                    <thead>
                                       <tr>
                                          <th colspan="3">@lang('general.marketplace')</th>
                                          <th class="text-right">
                                             <button  class="increase">
                                             <img id="expand_img7" onclick="myFunction3()"  src="{{ asset('public/web_assets/images/extend.png') }}" width="25px"/>
                                             <img id="expand_img8" onclick="myFunctionblock3()" style="display:none;" src="{{ asset('public/web_assets/images/collapse.png') }}" width="25px"/>
                                             </button>
                                          </th>
                                       </tr>
                                    </thead>
                                    <tbody>
                                        <?php $brand = DB::table('marketplace')->where('user_id', $userdetails->id)->get(); ?>
                                        @foreach($brand as $br)
                                        <?php                                            
                                            $watch = DB::table('product')->where('id', $br->watch_id)->first();
                                            $brand = DB::table('brand')->where('id', $watch->brand_id)->first();
                                            $offer = DB::table('offer')->where('watch_id', $br->watch_id)->count();
                                        ?>
                                        <tr>
                                            <td><a href="#"><img src="{{ asset('public/brand_image/') }}/{{ $brand->logo}}" width="30px"></a></td>
                                            <td colspan="2">
                                                <p>{{$watch->id_no}}</p>
                                                <span>{{$watch->model_name}}</span>
                                            </td>
                                            <td class="text-right">
                                            <button class="btn buy_btn" onclick="forMarketpace('{{$watch->id}}');">{{$offer}}-@lang('general.offer')</button>
                                                <a  style="cursor:pointer;" onclick="updateStatus('<?php echo $watch->id;?>','2','<?php echo $br->id;?>')" class="cancel">@lang('general.cancel')</a>
                                                
                                            </td>
                                        </tr>
                                        @endforeach                                       
                                    </tbody>
                                 </table>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" id="myID2">
                  <div class="row">
                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 grid-margin stretch-card fullwidthtable">
                        <div class="card">
                           <div class="card-body">
                              <div class="table-responsive" style="height: auto;">
                                 <table class="table">
                                    <thead class="fullwidth">
                                        <tr>
                                            <th colspan="3">@lang('general.transactions')</th>
                                            <th class="text-right">
                                            <button  class="increase">
                                            <img id="expand_img3" onclick="myFunction2()"  src="{{ asset('public/web_assets/images/extend.png') }}" width="25px"/>
                                            <img id="expand_img4" onclick="myFunctionblock2()" style="display:none;" src="{{ asset('public/web_assets/images/collapse.png') }}" width="25px"/>
                                            </button>
                                            </th>
                                        </tr>
                                    </thead>
                                 </table>
                                 <section id="tabs" class="project-tab">
                                    <div class="col-md-12 nopadding">
                                       <nav>
                                          <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                             <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">@lang('general.money')</a>
                                             <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">@lang('general.watch')</a>
                                          </div>
                                       </nav>
                                       <div class="tab-content" id="nav-tabContent">
                                          <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                             <div class="table-responsive table-responsive3">
                                                <table class="table" cellspacing="0">
                                                   <?php $Transactions = DB::table('wallet_transaction')->where('client_id', Session::get('gorgID'))->orderBy('id', 'DESC')->get(); ?>
                                                   <tbody>
                                                      @foreach($Transactions as $transData)
                                                      @if($transData->cr_dr_status == 1)
                                                      <tr>
                                                         <td colspan="2">
                                                            <span>
                                                               <p>Txn. ID : <b>{{ $transData->trans_id }}</b></p>
                                                               <p>Money/Debit/NEFT</p>
                                                            </span>
                                                         </td>
                                                         <td>
                                                            <p class="negative">- $ {{ $transData->withdrawal }}</p>
                                                            <span>{{ date('d-M-Y g:s a', strtotime($transData->date)) }}</span>
                                                         </td>
                                                      </tr>
                                                      @elseif($transData->cr_dr_status == 0)
                                                      <tr>
                                                         <td colspan="2">
                                                            <span>
                                                               <p>Txn. ID : <b>{{ $transData->trans_id }}</b></p>
                                                               <p><p>Money/Credit/NEFT</p></p>
                                                            </span>
                                                         </td>
                                                         <td>
                                                            <p class="positive">+ $ {{ $transData->deposit }}</p>
                                                            <span>{{ date('d-M-Y g:s a', strtotime($transData->date)) }}</span>
                                                         </td>
                                                      </tr>
                                                      @endif
                                                      @endforeach
                                                   </tbody>
                                                </table>
                                             </div>
                                          </div>
                                          <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                             <div class="table-responsive table-responsive3">
                                                <table class="table" cellspacing="0">
                                                    <?php $Transactions_watch = DB::table('wallet_transaction')->where('client_id', Session::get('gorgID'))->where('payment_mode', 'watch')->orderBy('id', 'DESC')->get();?>
                                                   <tbody>
                                                       @if(!empty($Transactions_watch))
                                                        @foreach($Transactions_watch as $transData_watch)
                                                        
                                                          <tr>
                                                             <td colspan="2">
                                                                <span>
                                                                   <p>Txn. ID : <b>{{ $transData_watch->trans_id }}</b></p>
                                                                   <p>Money/Debit/NEFT</p>
                                                                </span>
                                                             </td>
                                                             <td>
                                                                <p class="negative">- $ {{$transData_watch->deposit}}</p>
                                                                <span>{{ date('d-M-Y g:s a', strtotime($transData_watch->date)) }}</span>
                                                             </td>
                                                          </tr>
                                                      @endforeach
                                                      @endif
                                                   </tbody>
                                                </table>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </section>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 grid-margin stretch-card">
                        <div class="card">
                            <?php
                                $userdetail = DB::table('users')->where('id', Session::get('gorgID'))->first();
                            ?>
                            <div class="card-body">
                                <div class="table-responsive table-responsive4">
                                    <table class="table">
                                    <thead>
                                        <tr>
                                            <th colspan="4">@lang('general.accmanager')</th>
                                        </tr>
                                    </thead>
                                    <tbody class="user_detail">
                                        <tr style="border-bottom:0px">
                                            <td colspan="1">
                                                <img src="{{ asset('public/profile_image') }}/{{ $userdetail->profile_image}}" width="80px">
                                            </td>
                                            <td colspan="2">
                                                <ul>
                                                    <li><i class="fa fa-user-circle" aria-hidden="true"></i> {{ $userdetail->name }}</li>
                                                    <li><i class="fa fa-envelope" aria-hidden="true"></i> {{ $userdetail->email }}</li>
                                                    <li><i class="fa fa-phone" aria-hidden="true"></i> {{ $userdetail->phone }}</li>
                                                </ul>
                                            </td>
                                        </tr>
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<div  id="myModal3" class="modal modal3 fade" role="dialog" style="padding-right: 0px;">
   <div class="modal-dialog filter-modal">
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title">@lang('general.filter')</h4>
            <button type="button" class="close" onclick="dismiss()" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i></button>
         </div>
         <div class="modal-body col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="container-fluid">
               <div class="row">
                 <!--  <form class="form_outer mdt0  col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding"> -->
                     <form  action="{{ url('filter-brand-year') }}" method="POST" id="FormValidation" enctype="multipart/form-data" class="form_outer mdt0  col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
                     @csrf
                     <div class="row label-text">
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 selectdiv">
                            <label for="selectbrand">@lang('general.shortbybrand')</label>
                                <?php $brand = DB::table('brand')->get(); ?>
                            <select class="form-control" name="brand_id">
                                <option value="0">@lang('general.search') @lang('general.brand')</option>
                                @foreach($brand as $branddata)
                                    <option value="{{$branddata->id}}">{{$branddata->brand_name}}</option>
                                @endforeach                             
                            </select>
                        </div>
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 selectdiv">
                           <label for="selectyear">@lang('general.shortbyyeay')</label>
                                <select class="form-control" name="year">
                                    <option value="0">Select Year</option>
                                    <?php
                                    for($i = 1970; $i <= 1970+50; $i++){?>
                                        <option value="<?=$i?>"><?=$i?></option>
                                    <?php }
                                    ?>
                                </select>
                        </div>
                        <div class="form-group percentage col-lg-12 col-md-12 col-sm-12 col-xs-12">
                           <label for="pricerange">Price Range</label>
                           <div slider id="slider-distance">
                              <div>
                                 <div inverse-left style="width:70%;"></div>
                                 <div inverse-right style="width:70%;"></div>
                                 <div range style="left:0%;right:0%;"></div>
                                 <span thumb style="left:0%;"></span>
                                 <span thumb style="left:100%;"></span>
                                 <div sign style="left:0%;">
                                    <span id="value">0</span>
                                 </div>
                                 <div sign style="left: 96%;">
                                    <span id="value">100</span>
                                 </div>
                              </div>
                                <input type="range" name="min_rnage" value="0" max="100" min="0" step="1" oninput="
                                    this.value=Math.min(this.value,this.parentNode.childNodes[5].value-1);
                                    let value = (this.value/parseInt(this.max))*100
                                    var children = this.parentNode.childNodes[1].childNodes;
                                    children[1].style.width=value+'%';
                                    children[5].style.left=value+'%';
                                    children[7].style.left=value+'%';children[11].style.left=value+'%';
                                    children[11].childNodes[1].innerHTML=this.value;" />
                                <input type="range" name="max_range" value="100" max="100" min="0" step="1" oninput="
                                    this.value=Math.max(this.value,this.parentNode.childNodes[3].value-(-1));
                                    let value = (this.value/parseInt(this.max))*100
                                    var children = this.parentNode.childNodes[1].childNodes;
                                    children[3].style.width=(100-value)+'%';
                                    children[5].style.right=(100-value)+'%';
                                    children[9].style.left=value+'%';children[13].style.left=value+'%';
                                    children[13].childNodes[1].innerHTML=this.value;" />
                           </div>
                           <div class="row price_range">
                              <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 text-left">
                                 <span>${{$minmProductPrice}}</span>
                              </div>
                              <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right">
                                 <span>${{$maxProductPrice}}</span>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="row text-center">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                           <div class="row">
                              <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                 <button type="button" data-dismiss="modal" class="btn big_btn1 unactive"  onclick="#">Cancel
                                 </button>   
                              </div>
                              <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                 <button type="submitbutton" class="btn big_btn1"  onclick="#">Search
                                 </button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<div id="balancefail" class="modal modal3 fade" role="dialog" style="padding-right: 0px;">
   <div class="modal-dialog filter-modal">
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title"></h4>
            <button type="button" class="close" onclick="dismiss()" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i></button>
         </div>
         <div class="modal-body col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="container-fluid">
               <div class="row">
                 <!--  <form class="form_outer mdt0  col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding"> -->
                    @csrf                                            
                    <div class="form-group percentage col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label for="pricerange"><b>You don't have enough balance to purchase this product.Please add amount into wallet.</b></label>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <a type="button" class="btn big_btn1 mywallet"  href="{{ url('wallet') }}">Add Balance</a>
                    </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<div id="balancepass" class="modal modal3 fade" role="dialog" style="padding-right: 0px;">
   <div class="modal-dialog filter-modal">
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title"></h4>
            <button type="button" class="close" onclick="dismiss()" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i></button>
         </div>
         <div class="modal-body col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="container-fluid">
               <div class="row">
                    @csrf                                            
                    <div class="form-group percentage col-lg-12 col-md-12 col-sm-12 col-xs-12">
                       <label for="pricerange"><b style="color: green;">Thank you for purchasing our product. Your support and trust in us are much appreciated.</b></label>
                    </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>