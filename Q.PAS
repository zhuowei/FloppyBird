program q;
var loop:integer;
birdX:integer;
birdY:integer;
birdXVel:integer;
birdYVel:real;
keyalready:boolean;
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

begin
     birdX := 100;
     birdY := 100;
     birdXVel := 0;
     birdYVel := 0;
     keyalready := False;
     HiRes;
     for loop := 0 to 100 do
     begin
         HiRes;
         DrawBird;
         birdYVel := birdYVel + birdYAcc;
         birdY := Trunc(birdY + birdYVel);
         if KeyPressed and (not keyalready) then
         begin
              birdYVel := -10.0;
              keyalready := True;
         end;
         Delay(32);
     end;
     Delay(1000);
     TextMode;
end.