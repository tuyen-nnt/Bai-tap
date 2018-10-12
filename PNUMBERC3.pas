uses crt;
var A,B,k,i:integer;

function ktnt(i:integer): boolean;
  begin
    k:=2;
    while (k<=i-1) and ((i mod k)<>0) do k:=k+1;
    if (k>i-1) then ktnt:=true else ktnt:= false;
  end;

procedure primes;
  begin
     for i:=2 to B do
       if ktnt(i) then writeln(i);
  end;

begin
   clrscr;
   repeat
      readln(A,B);
   until (A >= 1) and (A <= B) and (B <= 200000);
   writeln;
   primes;
   readln
end.
