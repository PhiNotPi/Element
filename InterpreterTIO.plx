#print "Version 1.21\n";

my %ops = (
    '_' => 'push @m,$a=<STDIN>;',
    '`' => 'print pop@m;',
    ';' => '$a=pop@m;$hash{$a}=pop@m;',
    '~' => 'push@m,$hash{pop@m};',
    ':' => 'for(2..pop@m){push@m,$m[$#m]}',
    '.' => '$a=pop@m;$b=pop@m;push@m,$b.$a;',
    "'" => 'push@c,pop@m;',
    '"' => 'push@m,pop@c;',
    '$' => '$m[$#m]=length$m[$#m];',
    ')' => 'push@m,chop$m[$#m];',
    '(' => '$a=reverse pop@m;$b=chop$a;$a=reverse$a;push@m,$a;push@m,$b;',
    '#' => 'pop@m;',
    '+' => 'push(@m,(pop@m)+(pop@m));',
    '-' => '$m[$#m]*=-1;',
    '*' => 'push(@m,(pop@m)*(pop@m));',
    '/' => '$a=pop@m;push(@m,(pop@m)/$a);',
    '%' => '$a=pop@m;push(@m,(pop@m)%$a);',
    '^' => '$a=pop@m;push(@m,(pop@m)**$a);',
    '?' => '$a=0;if(pop@m){$a=1}push(@c,$a);',
    '!' => '$a=1;if(pop@c){$a=0}push(@c,$a);',
    '&' => '$a=0;if((pop@c)&&(pop@c)){$a=1}push(@c,$a);',
    '|' => '$d=0;$a=pop@c;$b=pop@c;if($a||$b){$d=1}push(@c,$d);',
    '=' => '$a=0;if((pop@m)eq(pop@m)){$a=1}push(@c,$a);',
    '>' => '$a=0;if((pop@m)<(pop@m)){$a=1}push(@c,$a);',
    '<' => '$a=0;if((pop@m)>(pop@m)){$a=1}push(@c,$a);',
    '[' => 'for(1..$c[$#c]){',
    ']' => '}',
    '{' => 'while($c[$#c]){',
    '}' => '}',
    ',' => '$a=pop@m;push(@m,chr($a));push(@m,ord($a));',
    '@' => '$a=pop@m;$b=pop@m;for(1..$b){push(@temp,pop@m)}$c=pop@m;for(1..$b){push(@m,pop@temp)}for(1..$a){push(@temp,pop@m)}push(@m,$c);for(1..$a){push(@m,pop@temp)}',
    ' ' => ' ',
    "\n"=> ' ',
);


$original = reverse $ARGV[0];

my $compiled = "";
my $pushstring = "";
while($original){
    my $char = chop $original;
    my $pushflag = 1;
    my $comp = "";
    if(exists $ops{$char}){
        $comp = $ops{$char};
    }
    else{
        $pushflag = 0;
    }
    if($char eq '\\'){
        $char = chop $original;
    }
    if($pushflag==1 && $pushstring ne ""){
        $compiled .= 'push(@m,\'' . $pushstring . '\');'; 
        $pushstring = "";
    }
    elsif($pushflag == 0){
        if($char eq "'" || $char eq '\\'){
            $char = '\\'.$char;
        }
        $pushstring .= $char;
    }
    $compiled .= $comp;
}
    
    
my @m;  #initialize variables for Element program to run
my @c;
my %hash;
eval $compiled;
    
