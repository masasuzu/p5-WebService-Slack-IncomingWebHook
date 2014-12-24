# NAME

Net::Slack - slack client

# SYNOPSIS

    use Net::Slack;
    my $net_slack = Net::Slack->new(
        webhook_url => 'http://xxxxxxxxxxxxxx',
    );
    my $net_slack->post(
        text       => 'yahoooooo!!',
    );

# DESCRIPTION

Net::Slack is slack incoming webhooks client.

# METHOD

- Net::Slack->new(%params)

        my $net_slack = Net::Slack->new(
            webhook_url => 'http://xxxxxxxxxxxxxx', # required
            channel    => '#general',               # optional
            username   => 'masasuzu',               # optional
            icon_emoji => ':sushi:',                # optional
            icon_url   => 'http://xxxxx/xxx.jpeg',  # optional
        );

    Creates new object.

- $net\_slack->post(%params)

        my $net_slack->post(
            text       => 'yahoooooo!!',
            channel    => '#general',
            username   => 'masasuzu',
            icon_emoji => ':sushi:',
            icon_url   => 'http://xxxxx/xxx.jpeg',
        );

    Post to slack incoming webhooks.
    _channel_, _username_, _icon\_emoji_ and _icon\_url_ parameters can override constructor's paramameter.

    _text_, _pretext_, _color_, _fields_ and _attachments_ parameter are available.
    See also slack incoming webhook document.

# SEE ALSO

[https://my.slack.com/services/new/incoming-webhook](https://my.slack.com/services/new/incoming-webhook)

# LICENSE

Copyright (C) SUZUKI Masashi.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

SUZUKI Masashi <m15.suzuki.masashi@gmail.com>
