package Net::Slack::Script;
use 5.008001;
use strict;
use warnings;
use Getopt::Long qw( :config posix_default no_ignore_case bundling auto_help );
use Net::Slack;

=head1 DESCTIPTION

post to slack incoming web hook.

=head1 SYNOPSIS

    % post-slack --webhook-uri='https://xxxxxx' --text='yahooo'

=cut


sub run {
    my ($class, @argv) = @_;
    local @ARGV = @argv;

    GetOptions(
        \my %opt => qw(
            text=s
            webhook_uri=s
            channel=s
            to_user=s
            username=s
            icon_url=s
            icon_emoji=s
        ),
    );
    my @required_options = qw( webhook_uri text );
    for my $o (@required_options) {
        Carp::croak("--$o option required") if ! exists $opt{$o};
    }

    my $webhook_uri = delete $opt{webhook_uri};
    Net::Slack->new(webhook_uri => $webhook_uri)->post(%opt);
}


1;
