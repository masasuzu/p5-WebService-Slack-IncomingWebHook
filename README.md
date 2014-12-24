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
    channel, username, icon\_emoji and icon\_url parameters can override constructor's paramameter.

    text, pretext, color, fields and attachments parameter are available.
    See also slack incoming webhook document.

# SEE ALSO

[https://my.slack.com/services/new/incoming-webhook](https://my.slack.com/services/new/incoming-webhook)

# LICENSE

Copyright (C) SUZUKI Masashi.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

SUZUKI Masashi <m15.suzuki.masashi@gmail.com>
