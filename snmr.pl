#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: snmr.pl
#
#        USAGE: ./snmr.pl  
#
#  DESCRIPTION: Simple Nagios Message Reciever
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: cloved (石头, Rock Chen -- chnl@163.com), cloved@gmail.com
# ORGANIZATION: itnms.info
#      VERSION: 1.0
#      CREATED: 01/23/2013 06:36:47 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;

##
#DS from Client
#http://NagiosServer:Port/cgi-bin/snmr?service={0}&severiy={1}&msg={2}&host={3}
##
##
#DS to Nagios 
#now=`date +%s`
#commandfile '/opt/nagios/var/rw/nagios.cmd'
#/bin/printf "[%lu] PROCESS_SERVICE_CHECK_RESULT;host1;service1;0;OK- Everything Looks Great\n" $now > $commandfile
##

use CGI qw/:standard/;
{
	my $cgi= new CGI;
	print $cgi->header;
	#$cgi->start_html('Simple Nagios Msg Reciever'),
	#$cgi->h1('Result');

	my $now = time();
	my $cmdfile='/opt/nagios/var/rw/nagios.cmd';

	if ( $cgi->param())
	{
		my $service= $cgi->param('service');
		my $severity= $cgi->param('severity');
		my $msg= $cgi->param('msg');
		my $host= $cgi->param('host');

		if ( -e $cmdfile ) {
			if (open(NCMD, ">$cmdfile")) {
				print NCMD ("[$now] PROCESS_SERVICE_CHECK_RESULT;$host;$service;$severity;$msg \n");
				close(NCMD);
				#print ("<p>\n");
				print "OK\n";
				#print ("<p>\n");
			}
			else{
				#print ("<p>\n");
				print "Error: Can not write to $cmdfile\n";
				#print ("<p>\n");
			}
		}
		else{
			#print ("<p>\n");
			print "Error: $cmdfile not exists\n";
			#print ("<p>\n");
		}
	}
	else{
		#print ("<p>\n");
		print "Error: No data found\n";
		#print ("<p>\n");
	}
	#$cgi->end_html();
	#my $form=qq(<form action="/cgi-bin/snmr" method="GET">
	#<input type="text" size="50" value="" name="service">
	#<input type="text" size="50" value="" name="severity">
	#<input type="text" size="50" value="" name="msg">
	#<input type="text" size="50" value="" name="host">
	#<input type=submit value="Submit">
	#</form>);
	#print $form."\n";
}
