uses crt;
type Binary = string[8];
var So1,So2,nhan,chia:integer;
function dec2bin(d:integer):Binary;
    var i:integer;
        bin:Binary;
    begin
        for i:=8 downto 1 do
            begin
                bin[i]:= chr((d mod 2) +48);
                d:=d div 2;
            end;
        dec2bin:=bin;
    end;

function c2n(c: char):integer;
    begin
       c2n :=  ord(c)-48;
    end;

function n2c(n: integer): char;
    begin
        n2c := chr(n+48);
    end;

function add(n1,n2: Binary): Binary;
    var i,r1,r2: integer;
        n: Binary;

    begin
        n[8] := n2c((c2n(n1[8]) + c2n(n2[8])) mod 2);

        for i:=7 downto 1 do
          begin

            r1 := c2n(n1[i+1]) and c2n(n2[i+1]);
            r2 := (c2n(n1[i+1]) or c2n(n2[i+1])) and not(c2n(n[i+1]));
            n[i] := n2c(((c2n(n1[i]) + c2n(n2[i]) + (r1 or r2)) mod 2));

          end;
        add := n;
    end;

function sub(n1,n2: Binary): binary;
    var  i:integer;
         A,bu2,tru:Binary;
    begin
        for i:=8 to 1 do
          begin
             if n2 [i]='1' then A[i]:='0' else A[i]:='1';
	  end;
        bu2:=add('1',A);
        bu2:=add(n1,bu2);

        bu2:=add(bu2,'-1');
        for i:=1 to 8 do
          begin
            if bu2[i]='1' then tru[i]:='0' else tru[i]:='1';
          end;
        sub:=tru;
	end;

function multiple(n1,n2:Binary): binary;
   var i,k,t:integer;
       n,tich:binary;
   begin
    n[1]:= n2c(c2n(n1[1])*c2n(n2[1]));
    t:= 1;
    for k:=1 to 8 do
      begin
        n[k]:= n2c(c2n(n[k]) shl 1);
        for i:=1 to 8 do
          begin
             n[k]:= n2c(c2n(n2[k])*c2n(n1[i]));
          end;
       end;
    tich:='0';
    tich:= add(tich,n[k]);
   end;


function bin2dec(bin:integer): Binary;
    var S:string[8];
    A:array[1..8] of integer;
    N,i,k,mu:integer;
   begin
      clrscr;
      write('Nhap vao xau nhi phan = ');
      readln(S);
      For i:=1 to length(s) do
        begin
           if S[i]='1' then A[i]:=1 else A[i]:=0;
        end;
      N:=0;
      for i:=1 to length(S) do
        begin
           mu:=1;
           for k:=1 to length(s)-i do mu:=mu*2;
           N:= N+A[i]*mu;
        end;
      write('So thap phan can tim = ',N);
      readln
   end;

begin
    clrscr;
    write('n1 = ');
    readln(So1);
    write('n2 = ');
    readln(So2);
    writeln('Nhi phan so 1 la ',dec2bin(So1));
    writeln('Nhi phan so 2 la ',dec2bin(So2));
    writeln('n1 + n2 =        ',add(dec2bin(So1),dec2bin(So2)));
    writeln('n1 - n2 =        ',sub(dec2bin(So1),dec2bin(So2)));
	nhan:= So1 * So2;
	chia:= So1 div So2;
	writeln('n1 * n2 =        ',dec2bin(nhan));
	 writeln('n1 / n2 =        ',dec2bin(chia));
        writeln('n1 nhan n2 =        ',multiple(dec2bin(So1),dec2bin(So2)));
    readln
end.
