# vim: ft=perl
requires 'perl', '5.008001';

requires 'Encode';
requires 'Furl';
requires 'IO::Socket::SSL'; # for https
requires 'JSON';

on 'test' => sub {
    requires 'Test::More', '0.96';
};

