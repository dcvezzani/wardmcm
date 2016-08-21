jQuery ->
  $('body').prepend('<div id="fb-root"></div>')

  $.ajax
    url: "#{window.location.protocol}//connect.facebook.net/en_US/all.js"
    dataType: 'script'
    cache: true


window.fbAsyncInit = ->
  FB.init(appId: '305988409753165', cookie: true)

  $('#sign_in').click (e) ->
    e.preventDefault()

    FB.login ((response) ->
      window.location = '/auth/facebook/callback' if response.authResponse
      return
    ),
      scope: 'email,user_birthday'
      return_scopes: true

  $('#sign_out').click (e) ->
    FB.getLoginStatus (response) ->
      FB.logout() if response.authResponse
    true

  $('#junk').click (e) ->
    url = '/me?fields=name,email'
    FB.api(url, (response) ->
      alert(response.name)
      alert(response.email)
    )
    
