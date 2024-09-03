// (function($) {
//     $.entwine('ss', function($) {
//         $('#Form_ItemEditForm_ProductID').entwine({
//             onchange: function() {
//                 var productId = $(this).val();
//                 if (productId) {
//                     $.ajax({
//                         url: '/promotion/getproductimage/' + productId,
//                         type: 'GET',
//                         dataType: 'json',
//                         success: function(response) {
//                             var imageSrc = response.imageSrc || '';
//                             var placeholder = $('#ProductImagePlaceholder');
//                             var $img = placeholder.find('img');
//                             var $p = placeholder.find('p');
                            
//                             if (imageSrc) {
//                                 $img.attr('src', imageSrc).show();
//                                 $p.hide();
//                             } else {
//                                 $img.hide();
//                                 $p.show();
//                             }
//                         }
//                     });
//                 } else {
//                     $('#ProductImagePlaceholder').find('img').hide();
//                     $('#ProductImagePlaceholder').find('p').show();
//                 }
//             }
//         });
//     });
// })(jQuery);
