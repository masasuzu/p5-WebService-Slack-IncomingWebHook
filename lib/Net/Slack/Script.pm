package Net::Slack::Script;
use 5.008001;
use strict;
use warnings;
use utf8;

use Encode qw( decode_utf8 );
use Getopt::Long qw( :config posix_default no_ignore_case bundling auto_help );
use Net::Slack;

=head1 DESCTIPTION

post to slack incoming web hook.

=head1 SYNOPSIS

    % post-slack --webhook-url='https://xxxxxx' --text='yahooo'

=cut


sub run {
    my ($class, @argv) = @_;
    local @ARGV = @argv;

    GetOptions(
        \my %opt => qw(
            text=s
            webhook_url=s
            channel=s
            username=s
            icon_url=s
            icon_emoji=s
        ),
    );
    my @required_options = qw( webhook_url text );
    for my $o (@required_options) {
        Carp::croak("--$o option required") if ! exists $opt{$o};
    }

    my $webhook_url = delete $opt{webhook_url};

    # for multibyte character
    $opt{$_} = decode_utf8($opt{$_}) for keys %opt;

    Net::Slack->new(webhook_url => $webhook_url)->post(%opt);
}


1;
