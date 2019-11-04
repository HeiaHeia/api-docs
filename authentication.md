# Authentication

There are two ways to authenticate through HeiaHeia API v2.

### OAuth2 Token (sent in a header)

```

    $ curl -H "Authorization: Bearer OAUTH-TOKEN" https://api.heiaheia.com/v2/

```

### OAuth2 Token (sent as a parameter)

```

    $ curl https://api.heiaheia.com/v2/?access_token=OAUTH-TOKEN

```

Read [more about OAuth2](http://oauth.net/2/).
