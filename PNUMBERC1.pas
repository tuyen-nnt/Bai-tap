uses crt;
var A,B,n,k,i,dem:integer;
begin
   clrscr;
   repeat
      write('Nhap vao A va B, A < B : ');
      readln(A,B);
   until (A >= 1) and (A <= B) and (B <= 200000);

   if B = 1 then write('Khong co so nguyen to');

   if (A <= 2) and (B >= 2) then writeln(2);

   for i:= 2 to B do
       begin
        if odd(i) then
           begin
              dem:=0;
              k:= i div 2;
              for n:= 2 to k do
                begin
                  if i mod n = 0 then dem:= dem +1;
                end;
              if dem = 0 then writeln(i);
           end;
        end;
    readln
end.
