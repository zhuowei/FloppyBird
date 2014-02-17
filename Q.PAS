program q;
var loop:integer;
birdX:integer;
birdY:integer;
birdXVel:integer;
birdYVel:real;
keyalready:boolean;
keychar:char;
gamerunning:boolean;
pipex:integer;
pipey:integer;
soundremaining:boolean;
const birdYAcc:real = 0.8;
birdWidth:integer = 10;
birdHeight:integer = 8;

procedure DrawBird;
var x:Integer;
y:Integer;
begin
     for x := birdX to birdX + birdWidth do
     begin
          for y := birdY to birdY + birdHeight do
          begin
               Plot(x, y, 1);
          end;
     end;
end;

procedure DrawRect(x1, y1, width, height: integer);
begin
     Draw(x1, y1, x1, y1 + height, 1);
     Draw(x1, y1, x1 + width, y1, 1);
     Draw(x1 + width, y1, x1 + width, y1 + height, 1);
     Draw(x1, y1 + height, x1 + width, y1 + height, 1);
end;

procedure DrawPipes;
var p:Integer;
x1:Integer;
y1:Integer;
begin
     {for p := 0 to 1 do
     begin}
          x1 := pipex;
          DrawRect(x1, 0, 50, pipey);
          DrawRect(x1, pipey + 50, 50, 200 - pipey - 50);
     {end;}
end;

begin
     birdX := 100;
     birdY := 100;
     birdXVel := 0;
     birdYVel := 0;
     keyalready := False;
     gamerunning := True;
     pipex := 300;
     pipey := 50;
     soundremaining := False;
     HiRes;
     while gamerunning do
     begin
         Randomize;
         HiRes;
         birdYVel := birdYVel + birdYAcc;
         birdY := Trunc(birdY + birdYVel);
         if KeyPressed then
         begin
              birdYVel := -10.0;
              Read(Kbd, keychar);
              if keychar = #27 then
                 gamerunning := False
         end;
         pipex := pipex - 8;
         if pipex < -50 then
         begin
             pipex := 300;
             pipey := pipey + random(40) - 20;
         end;
         DrawBird;
         DrawPipes;
         if (birdY > 200) or ((birdx + birdWidth > pipex) and (birdx < pipex + 50)
            and ((birdy + birdHeight >= pipey + 50) or (birdy < pipey)) ) then
         begin
              gamerunning := False;
         end;
         if gamerunning and (birdx + birdwidth = pipex + 50) then
         begin
              sound(1760);
              soundremaining := True;
         end
         else
         begin
              if soundremaining then
              begin
                 NoSound;
                 soundremaining := False;
              end;
         end;
         Delay(32);
     end;
     for loop := 440 downto 220 do
     begin
          Sound(loop);
          Delay(2);
     end;
     NoSound;
     TextMode;
end.