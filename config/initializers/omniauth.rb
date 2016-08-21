OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '305988409753165', '6da9c55c5362b9346234d83285df24e4', 
    scope: 'email,user_birthday'#, display: 'popup'  
end


=begin
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '305988409753165',
      xfbml      : true,
      version    : 'v2.7'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>
=end
