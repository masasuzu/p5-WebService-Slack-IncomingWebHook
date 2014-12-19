package Net::Slack;
use 5.008001;
use strict;
use warnings;
use JSON;
use Furl;
use Carp ();

our $VERSION = "0.01";

sub new {
    my ($class, %args) = @_;
    Carp::croak('required webhook uri') if ! exists $args{webhook_uri};

    my $self = bless { %args } => $class;

    $self->{json} = JSON->new->utf8;
    $self->{furl} = Furl->new(agent => "$class.$VERSION");

    return $self;
}

sub post {
    my ($self, %args) = @_;
    my $user    = delete $args{user}    || $self->{user};
    my $channel = delete $args{channel} || $self->{channel};

    $channel = $user    ? sprintf('@%s', $user)    :
               $channel ? sprintf('#%s', $channel) : undef;

    my $post_data = +{ %args };
    $post_data->{channel} = $channel if defined $channel;

    my $res = $self->{furl}->post($self->{webhook_uri}, ['Content-Type' => 'application/json'], $self->{json}->encode($post_data));
    if (! $res->is_success) {
        Carp::carp('post failed: '. $res->body);
    }
}



1;
__END__

=encoding utf-8

=head1 NAME

Net::Slack - slack client

=head1 SYNOPSIS

    use Net::Slack;
    my $slack = Net::Slack->new(
        webhook_uri => 'http://xxxxxxxxxxxxxx',
    );
    my $slack->post(
        text    => 'yahoooooo!!',
        channel => '#general',
    );

=head1 DESCRIPTION

Net::Slack is slack client.

=head1 LICENSE

Copyright (C) masashi.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

SUZUKI Masashi E<lt>m15.suzuki.masashi@gmail.comE<gt>

=cut

