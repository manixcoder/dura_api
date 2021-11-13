<?php

$router->get('/', function () use ($router) {
    //return $router->app->version(); 
});

$router->get('alllocation', 'ExternalController@complocation');
$router->post('refercode', 'ExternalController@refercode');
$router->get('allcountry', 'ExternalController@allcountry');
$router->post('otpsent', 'OtpController@otpsent');
$router->post('send_otp', 'OtpController@send_otp');
$router->post('getdistance', 'CartController@getdistance');

$router->group(['prefix' => 'api'], function () use ($router) {

    $router->post('driverSendOTP', 'DriverManagementController@sendOTP');
    $router->post('driverVerifyOTP', 'DriverManagementController@verifyOTP');
    $router->post('driverRegistration', 'DriverManagementController@driverRegistration');
    $router->post('driverUpdateProfile', 'DriverManagementController@driverUpdateProfile');
    $router->post('driverLogin', 'DriverManagementController@driverLogin');
    $router->post('driverServiceArea', 'DriverManagementController@driverServiceArea');
    $router->post('driverUpdatePassword', 'DriverManagementController@driverUpdatePassword');
    $router->post('getDriverDetails', 'DriverManagementController@getDriverDetails');
    $router->post('driverDutyStatus', 'DriverManagementController@driverDutyStatus');
    $router->post('driverCurrentLocation', 'DriverManagementController@driverCurrentLocation');
    $router->post('driverAutoAcceptStatus', 'DriverManagementController@driverAutoAcceptStatus');
    $router->post('getDriverNotification', 'DriverManagementController@getDriverNotification');
    $router->post('driverPickupDecline', 'DriverManagementController@driverPickupDecline');
    $router->post('driverAcceptPickup', 'DriverManagementController@driverAcceptPickup');
    $router->post('driverVerifyItems', 'DriverManagementController@driverVerifyItems');
    $router->post('driverLicenseUpload', 'DriverManagementController@driverLicenseUpload');
    $router->post('driverPoliceVerifcationUpload', 'DriverManagementController@driverPoliceVerifcationUpload');
    $router->post('driverClearanceUpload', 'DriverManagementController@driverClearanceUpload');
    $router->post('driverVehicleUpload', 'DriverManagementController@driverVehicleUpload');
    $router->post('driverProfilePicUpload', 'DriverManagementController@driverProfilePicUpload');
    $router->post('driverPersonalInfoUpload', 'DriverManagementController@driverPersonalInfoUpload');
    $router->post('driverGCashdetailUpload', 'DriverManagementController@driverGCashdetailUpload');
    $router->post('driverDurabagIDUpload', 'DriverManagementController@driverDurabagIDUpload');
    $router->post('driverPickupDetails', 'DriverManagementController@driverPickupDetails');
    $router->post('driverdocUpload', 'DriverManagementController@driverdocUpload');
    $router->post('driverAddBankDetails', 'DriverManagementController@driverAddBankDetails');
    $router->post('driverRatingDetails', 'DriverManagementController@driverRatingDetails');
    $router->post('driverPushNotification', 'DriverManagementController@driverPushNotification');
    $router->post('driverSupport', 'DriverManagementController@driverSupport');
    $router->post('driverRating', 'DriverManagementController@driverRating');
    $router->post('driverReferral', 'DriverManagementController@driverReferral');


    $router->post('register', 'AuthController@register');
    //$router->post('register', 'UserController@register');
    $router->post('login', 'AuthController@login');
    $router->post('send_otp', 'OtpController@send_otp');
    $router->post('varify_otp', 'OtpController@varify_otp');
    $router->post('forgot_passworduser', 'OtpController@forgot_passworduser');
    $router->post('user_driverrequest', 'CartController@user_driverrequest');
    $router->post('testotp', 'CartController@testotp');



    //Driver
    $router->post('drivernoti', 'DriverController@drivernoti');
    $router->post('finddriver', 'CartController@finddriver');
    $router->post('driver_current_location', 'CartController@driver_current_location');
    $router->post('denied_request', 'CartController@denied_request');
    //User

    $router->post('userReviewRating', 'UserController@userReviewRating');
    $router->post('userDriverRating', 'UserController@userDriverRating');
    $router->post('userReferralCode', 'UserController@userReferralCode');
    $router->post('useReferralCodeByUsers', 'UserController@useReferralCodeByUsers');

    //$router->post('register', 'AuthController@register');
    //$router->post('login', 'AuthController@login');
    $router->post('profile', 'UserController@profile');
    $router->post('update_user_name', 'UserController@update_user_name');
    $router->post('update_country', 'UserController@update_country');
    $router->post('update_phone', 'UserController@update_phone');
    $router->post('user_password_update', 'UserController@user_password_update');
    $router->post('getlocation', 'UserController@getlocation');
    //$router->post('refercode', 'UserController@refercode');
    $router->post('addaddress', 'CartController@addaddress');
    $router->post('getaddress', 'UserController@getaddress');
    $router->post('updateaddress', 'UserController@updateaddress');
    $router->post('deleteaddress', 'UserController@deleteaddress');
    $router->post('updatesociallink', 'UserController@updatesociallink');
    $router->post('getsociallink', 'UserController@getsociallink');
    $router->post('addcard', 'UserController@addcard');
    $router->post('getcard', 'UserController@getcard');
    $router->post('updatecard', 'UserController@updatecard');
    $router->post('deletecard', 'UserController@deletecard');
    $router->post('getpersonaldoc', 'UserController@getpersonaldoc');
    $router->post('getbusinessdoc', 'UserController@getbusinessdoc');
    $router->post('updatedocument', 'UserController@update_document');
    $router->post('userpersonaldoc', 'UserController@userpersonaldoc');
    $router->post('userbusinessdoc', 'UserController@userbusinessdoc');
    $router->post('deletedocument', 'UserController@delete_document');
    $router->post('create_notification', 'CartController@createNotifications');
    $router->post('get_notification', 'CartController@get_notification');
    $router->post('read_notification', 'CartController@read_notification');
    //$router->post('alllocation', 'UserController@alllocation');

    $router->get('users/{id}', 'UserController@singleUser');
    $router->get('users', 'UserController@allUsers');
    $router->get('category', 'HomeController@get_category');
    $router->get('users', 'HomeController@get_users');
    $router->get('customers', 'HomeController@get_customers');
    $router->post('add-customers', 'HomeController@add_customer');
    $router->post('edit-customers', 'HomeController@edit_customer');
    $router->get('get-brands', 'HomeController@get_brands');
    $router->get('get-category', 'HomeController@get_category');
    $router->get('get-products', 'ProductController@get_products');
    $router->get('get-all-product-order', 'ProductController@product_order');
    $router->post('product-get-varients', 'ProductController@product_get_accordingto_brandid');
    $router->post('add-product-stock', 'ProductController@add_product_stock');
    $router->post('get-product-stock-according-to-band', 'ProductController@get_product_stock_according_to_brand');
    $router->post('get-product-according-to-band-_id', 'ProductController@get_product_according_to_brand_id');

    $router->get('get_products_according_to_id/{id}', 'ProductController@get_products_according_to_id');

    $router->post('add-product', 'ProductController@add_product');
    $router->get('get-color', 'HomeController@get_color');
    $router->post('get-stock-according-to-coloror-barnd', 'ProductController@get_stock_according_to_coloror_barnd');
    $router->post('update-stock', 'ProductController@update_stock');
    $router->get('get-wherehouse', 'HomeController@get_wherehouse');
    $router->post('get_product_by_brand_varient_color', 'ProductController@get_product_by_brand_varient_color');
    $router->post('get-color-by-brand-varient', 'ProductController@get_color_by_brand_varient');
    $router->post('loan-apply', 'HomeController@apply_loan');
    $router->get('get_loans', 'HomeController@get_loans');
    $router->get('search-car', 'ProductController@search_car');
    $router->post('upload-image', 'HomeController@upload_image');
    $router->post('get_stock_items_by_warehouse_id', 'WarehouseController@get_stock_items_by_warehouse_id');

    $router->post('create_customer', 'CustomerController@create_customer');
    $router->post('update_customer', 'CustomerController@update_customer');
    $router->get('get_customer/{id}', 'CustomerController@get_customer');
    $router->get('get_all_customer', 'CustomerController@get_all_customer');

    $router->post('create_invoice', 'InvoiceController@create_invoice');
    $router->post('update_invoice', 'InvoiceController@update_invoice');
    $router->get('get_invoice/{id}', 'InvoiceController@get_invoice');
    $router->get('get_all_invoice', 'InvoiceController@get_all_invoice');
    $router->get('get_invoice_by_customer_id/{id}', 'InvoiceController@get_invoice_by_customer_id');

    $router->post('create_quote', 'QuoteController@create_quote');
    $router->post('update_quote', 'QuoteController@update_quote');
    $router->get('get_quote/{id}', 'QuoteController@get_quote');
    $router->get('get_all_quote', 'QuoteController@get_all_quote');

    $router->get('get_warehouse_info', 'WarehouseController@get_warehouse_info');
    $router->get('get_warehouse_info_by_id/{id}', 'WarehouseController@get_warehouse_info_by_id');

    $router->post('create_notifications', 'NotificationsController@create_notifications');
    $router->post('update_notifications', 'NotificationsController@update_notifications');
    $router->get('get_notifications/{id}', 'NotificationsController@get_notifications');
    $router->get('get_all_notifications', 'NotificationsController@get_all_notifications');
    $router->get('get_notifications_by_customer_id/{id}', 'NotificationsController@get_notifications_by_customer_id');

    $router->post('allorder_ByUser_id', 'OrdersController@order_details_ByUser_id');
    $router->post('create_product_order', 'OrdersController@create_product_order');
    $router->post('update_orderpayment_status', 'OrdersController@update_orderpayment_status');
    $router->post('update_product_order', 'OrdersController@update_product_order');
    $router->get('get_product_order/{id}', 'OrdersController@get_product_order');
    $router->get('Order/{id}', 'OrdersController@orderByuserid');
    $router->get('get_all_product_order', 'OrdersController@get_all_product_order');
    $router->get('get_product_order_by_customer_id/{id}', 'OrdersController@get_product_order_by_customer_id');
    $router->get('get_product_order_by_order_type', 'OrdersController@get_product_order_by_order_type');
    $router->post('place_order', 'OrdersController@place_order');
    $router->post('place_order_with_address', 'OrdersController@place_order_with_address');

    $router->post('shedule_pickup', 'CartController@shedule_pickup');
    $router->post('savepickup_details', 'CartController@pickup_details');
    $router->post('cancel_details', 'CartController@cancel_details');
    $router->get('walletpackege', 'CartController@walletpackege');
    $router->get('tipprice', 'CartController@tipprice');
    $router->post('getvehicle', 'CartController@get_vehicle');
    $router->post('addtowallet', 'CartController@addtowallet');
    $router->post('wallet_history', 'CartController@wallet_history');

    $router->post('send_driver_request', 'CartController@send_driver_request');
    $router->post('denied_request', 'CartController@denied_request');
    $router->post('accept_request', 'CartController@accept_request');
    $router->post('get_driver_details', 'CartController@get_driver_details');
    $router->post('get_pickup_details', 'CartController@get_pickup_details');
    $router->post('getOrderPriceBreakdetails', 'CartController@getOrderPriceBreakdetails');
    $router->post('order_details', 'CartController@order_details');
    $router->post('add_to_user_cart', 'CartController@add_to_user_cart');
    $router->post('remove_user_cart', 'CartController@remove_user_cart');
    $router->post('update_user_cart', 'CartController@update_user_cart');
    $router->post('update_create_user', 'CartController@update_create_user');
    $router->get('get_user_cart/{id}', 'CartController@get_user_cart');
    $router->get('get_all_user_cart', 'CartController@get_all_user_cart');
    $router->post('remove_user_cart', 'CartController@remove_user_cart');
    $router->post('paymentmode', 'CartController@paymentmode');

    $router->post('getpromocode', 'OtpController@getpromocode');
    $router->post('varifypromocode', 'OtpController@varify_promocode');
    /*
    $router->post('send_otp', 'OtpController@send_otp');
  
    $router->post('varify_otp', 'OtpController@varify_otp');
    */
    $router->post('create_new_password_with_otp', 'OtpController@create_new_password_with_otp');

    $router->post('add_to_user_wishlist', 'WishlistController@add_to_user_wishlist');
    $router->post('remove_user_wishlist', 'WishlistController@remove_user_wishlist');
    $router->get('get_user_wishlist_by_customer_id/{id}', 'WishlistController@get_user_wishlist_by_customer_id');
});



//$router->group(['prefix' => 'api', 'middleware' => 'auth'], function () use ($router) {
$router->group(['prefix' => 'api'], function () use ($router) {
});
