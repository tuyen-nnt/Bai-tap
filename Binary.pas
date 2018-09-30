uses crt;
type Binary = string[8];
var n,So1,So2,i:integer;
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
    var i,r: integer;
        n: Binary;

    begin
        n[8] := n2c((c2n(n1[8]) + c2n(n2[8])) mod 2);
        n[7] := n2c((c2n(n1[7]) + c2n(n2[7]) + c2n(n1[8]) and c2n(n2[8])) mod 2);
        r:=0;
        for i:=6 downto 1 do
          begin
            if r=2 then r:= r shl 1;
            r := (c2n(n1[i+1]) + c2n(n2[i+1])) div 2 + r;

            n[i]:= n2c((c2n(n1[i]) + c2n(n2[i]) + r) mod 2);


          end;
        add := n;
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
    readln
end.

