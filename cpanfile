requires 'perl', '5.010001';

requires 'Moose';
requires 'Dist::Zilla';

on test => sub {
	requires 'Test::More', '0.96';
};
