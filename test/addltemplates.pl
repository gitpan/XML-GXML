#!/usr/bin/perl

# GXML test suite - addltemplates.pl
# by Josh Carter <josh@multipart-mixed.com>
#
# Tests the dynamic template feature

use strict;
use XML::GXML;

my $xml = '<base><dyna-template/></base>';

my $gxml = new XML::GXML(
		{'addlTempExists'  => \&CheckAddlTemplate,
		 'addlTemplate'    => \&AddlTemplate});

print "\nbefore:\n";
print $xml;
print "\nafter:\n";
print $gxml->Process($xml);
print "\n";

exit;

sub CheckAddlTemplate
{
	my $name = shift;

	if ($name eq 'dyna-template') { return 1; }
	else                          { return 0; }
}

sub AddlTemplate
{
	my $name = shift;

	if ($name eq 'dyna-template')
		# remember: return value is a reference
		{ return \'<p>hello there</p>'; }
	else
		{ return undef; }
}

