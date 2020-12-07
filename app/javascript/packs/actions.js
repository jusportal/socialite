// $(document).on('turbolinks:load', function(){
//   $(".like-button").click(function() {
//     const postId = $(this).closest('button').attr('id');
//     const data = {'reaction[reaction_type]': 'like'};

//     $.ajax({
//       beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
//       data,
//       type: 'POST',
//       url: `/posts/${postId}/react`,
//       success(data) {
//         $(`#${postId}-reactions`).html(data);
//       }
//     });
//   });

//   $(".heart-button").click(function() {
//     const postId = $(this).closest('button').attr('id');
//     const data = {'reaction[reaction_type]': 'heart'};

//     $.ajax({
//       beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
//       data,
//       type: 'POST',
//       url: `/posts/${postId}/react`,
//       success(data) {
//         $(`#${postId}-reactions`).html(data);
//       }
//     });
//   });
// });
