library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
#myapp <- oauth_app("github",
#                   key = "4d5c9ae2412a2a30a9da",
#                   secret = "894ed180e88c49e27b1b90c83febe94ad89292ce"
#)

# 3. Get OAuth credentials
#github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
#gtoken <- config(token = github_token)
#req <- GET("xhttps://api.github.com/users/jtleek/repos", gtoken)
#stop_for_status(req)
#result <- content(req)

# OR:
#req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
#stop_for_status(req)
#content(req)

file <- download.file("https://api.github.com/users/jtleek/repos",destfile = "sample.json", method = "curl" , headers = c("username:7a98d90eba9efdb150209c89c7440166b0a70163"))






