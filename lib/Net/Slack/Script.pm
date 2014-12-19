package Net::Slack::Script;
use 5.008001;
use strict;
use warnings;
use Getopt::Long qw( :config posix_default no_ignore_case bundling auto_help );
use Net::Slack;

=head1 DESCTIPTION

post to slack incoming web hook.

=head1 SYNOPSIS

    % post-slack --post-uri='https://xxxxxx' --text='yahooo'

=cut


sub run {
    my ($class, @argv) = @_;
    local @ARGV = @argv;

    GetOptions(
        \my %opt => qw(
            text=s
            post_uri=s
            channel=s
            user=s
        ),
    );
    my @required_options = qw( post_uri text );
    for my $o (@required_options) {
        Carp::croak("--$o option required") if ! exists $opt{$o};
    }

    my $post_uri = delete $opt{post_uri};
    Net::Slack->new(post_uri => $post_uri)->post(%opt);
}


1;
