program q;
var loop:integer;
birdX:integer;
birdY:integer;
birdXVel:integer;
birdYVel:real;
keyalready:boolean;
keychar:char;
const birdYAcc:real = 0.4;

procedure DrawBird;
var x:Integer;
y:Integer;
begin
     for x := birdX to birdX + 10 do
     begin
          for y := birdY to birdY + 10 do
          begin
               Plot(x, y, 1);
          end;
     end;
end;

procedure DrawPipes;
var p:Integer;
x:Integer;
y:Integer;
begin
     for p := 0 to 3 do
     begin
     end;
end;

begin
     birdX := 100;
     birdY := 100;
     birdXVel := 0;
     birdYVel := 0;
     keyalready := False;
     HiRes;
     for loop := 0 to 1000 do
     begin
         HiRes;
         DrawBird;
         birdYVel := birdYVel + birdYAcc;
         birdY := Trunc(birdY + birdYVel);
         if KeyPressed then
         begin
              birdYVel := -10.0;
              Read(Kbd, keychar);
         end;
         Delay(16);
     end;
     Delay(1000);
     TextMode;
end.