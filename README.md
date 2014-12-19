# NAME

Net::Slack - slack client

# SYNOPSIS

    use Net::Slack;
    my $slack = Net::Slack->new(
        webhook_uri => 'http://xxxxxxxxxxxxxx',
    );
    my $slack->post(
        text    => 'yahoooooo!!',
        channel => '#general',
    );

# DESCRIPTION

Net::Slack is slack client.

# LICENSE

Copyright (C) masashi.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

SUZUKI Masashi <m15.suzuki.masashi@gmail.com>
