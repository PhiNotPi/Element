#Element is an interpreted programming language that I created in order to write very concise and human-readable programs for code golf competitions. 
#Element follows the  principle of "One character, one function, all the time." This allows the language to be much easier to learn and understand (and to write an interpreter for).
#Element has three data structures: a main stack, a control stack, and a hash.
#One notable feature of Element is the ability to create variables using the hash.

#This interpreter is written in Perl because I felt that most of the commands were very straight-forward to convert into Perl, and because I didn't feel like figuring out how to write it in C.

#To use, run this on the command line as "perl interpreterfilename.plx". 
#On the next few lines, you can type in your Element program. 
#Once it encounters a completely blank line, it will convert the code to Perl and print it. 
#It will then evaluate your program, taking input and printing output as needed.



$/="\n\n";
chop($original=<>);
$/="\n";
$original=reverse$original;
while($original){
$char=chop$original;

$pushflag=1;
$comp="";
   if($char eq '_'){$comp='$a=<>;push(@m,$a);'}
elsif($char eq '`'){$comp='$a=pop@m;print$a;'}
elsif($char eq ';'){$comp='$a=pop@m;$b=pop@m;$hash{$a}=$b;'}
elsif($char eq '~'){$comp='$a=pop@m;push(@m,$hash{$a});'}
elsif($char eq ':'){$comp='$a=pop@m;$b=pop@m;for(1..$a){push(@m,$b);};'}
elsif($char eq '.'){$comp='$a=pop@m;$b=pop@m;push(@m,$b.$a);'}
elsif($char eq "'"){$comp='$a=pop@m;push(@c,$a);'}
elsif($char eq '"'){$comp='$a=pop@c;push(@m,$a);'}
elsif($char eq '$'){$comp='$a=pop@m;push(@m,length$a);'}
elsif($char eq ')'){$comp='$a=pop@m;$b=chop$a;push(@m,$a);push(@m,$b);'}
elsif($char eq '('){$comp='$a=pop@m;$a=reverse$a;$b=chop$a;$a=reverse$a;push(@m,$a);push(@m,$b);'}
elsif($char eq '#'){$comp='$a=pop@m;'}
elsif($char eq '+'){$comp='$a=pop@m;$b=pop@m;push(@m,$b+$a);'}
elsif($char eq '-'){$comp='$a=pop@m;push(@m,-$a);'}
elsif($char eq '*'){$comp='$a=pop@m;$b=pop@m;push(@m,$b*$a);'}
elsif($char eq '/'){$comp='$a=pop@m;$b=pop@m;push(@m,$b/$a);'}
elsif($char eq '%'){$comp='$a=pop@m;$b=pop@m;push(@m,$b%$a);'}
elsif($char eq '^'){$comp='$a=pop@m;$b=pop@m;push(@m,$b**$a);'}
elsif($char eq '?'){$comp='$a=pop@m;if($a){push(@c,1)}else{push(@c,0)};'}
elsif($char eq '!'){$comp='$a=pop@c;if($a){push(@c,0)}else{push(@c,1)};'}
elsif($char eq '&'){$comp='$a=pop@c;$b=pop@c;if($a && $b){push(@c,1)}else{push(@c,0)};'}
elsif($char eq '|'){$comp='$a=pop@c;$b=pop@c;if($a || $b){push(@c,1)}else{push(@c,0)};'}
elsif($char eq '='){$comp='$a=pop@m;$b=pop@m;if($a eq $b){push(@c,1)}else{push(@c,0)};'}
elsif($char eq '>'){$comp='$a=pop@m;$b=pop@m;if($b > $a){push(@c,1)}else{push(@c,0)};'}
elsif($char eq '<'){$comp='$a=pop@m;$b=pop@m;if($b < $a){push(@c,1)}else{push(@c,0)};'}
elsif($char eq '['){$comp='$a=pop@c;push(@c,$a);for(1..$a){'}
elsif($char eq ']'){$comp='}'}
elsif($char eq '{'){$comp='while($c[$#c]){'}
elsif($char eq '}'){$comp='}'}
elsif($char eq ','){$comp='$a=pop@m;push(@m,chr($a));push(@m,ord($a));'}
elsif($char eq '@'){$comp='$a=pop@m;$b=pop@m;for(1..$b){push(@temp,pop@m)}$c=pop@m;for(1..$b){push(@m,pop@temp)}for(1..$a){push(@temp,pop@m)}push(@m,$c);for(1..$a){push(@m,pop@temp)}'}
elsif($char eq ' ' || $char eq "\n"){}
else{$pushflag=0}

if($char eq '\\'){$char=chop$original}

if($pushflag==1 && $pushstring ne ""){$compiled.='push(@m,\'' . $pushstring . '\');';  $pushstring = ""}
elsif($pushflag == 0){if($char eq "'" || $char eq '\\'){$char='\\'.$char}$pushstring.=$char}
$compiled.=$comp;
}
print"$compiled\n";
eval$compiled
