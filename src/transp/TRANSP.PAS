var f,o:file; i,x:integer; l:longint; change:boolean;
buf:array[1..50000]of byte;
const new_arr:array[1..3]of byte=(0,0,8);{BMPs are 24 bit and GFXs are 15 bit.
So every byte is divided by 8. RGB=0,0,8 is used in MK4 to define BLACK.}


begin
writeln('BMP Transparency Changer for MK4Strip by SORCERER.');
if paramcount<2 then writeln('Usage: transp infile.bmp outfile.bmp [DestinationColor]') else
begin
if paramcount>2 then val(paramstr(3),new_arr[3],x);
assign(f,paramstr(1)); reset(f,1);
assign(o,paramstr(2)); rewrite(o,1);
l:=filesize(f)-256*256*3;
{Header}
blockread(f,buf,l);
blockwrite(o,buf,l);
{Data}
for x:=1 to 4 do
begin
  blockread(f,buf,256*3*64);
  for l:=0 to 256*64-1 do
  begin
     change:=true;
     for i:=1 to 3 do if buf[l*3+i]<>0 then change:=false;
     if change then for i:=1 to 3 do buf[l*3+i]:=new_arr[i];
  end;
  blockwrite(o,buf,256*3*64);
end;
close(f);close(o);
end;
end.