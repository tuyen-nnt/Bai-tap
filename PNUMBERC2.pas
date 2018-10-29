uses crt;
var A,B,n,k,i,dem:integer;
begin
   clrscr;
   repeat
      readln(A,B);
   until (A >= 1) and (A <= B) and (B <= 200000);
   writeln;

   if (A <= 2) and (B >= 2) then 
   begin
     writeln(2);
     for i:= 2 to B do
       begin
        if odd(i) then
           begin
              dem:=0;
              for n:= 2 to trunc(sqrt(i)) do
                begin
                  if i mod n = 0 then dem:= dem +1;
                end;
              if dem = 0 then writeln(i);
           end;
        end;
    end;
readln
end.
