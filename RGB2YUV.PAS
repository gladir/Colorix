{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2022
  @website(https://www.gladir.com/colorix)
  @abstract(Target: Turbo Pascal, Free Pascal)
}

Program RGB2YUV;

Var
 R,G,B:Byte;
 Err:Word;
 Y,U,V:Real;

BEGIN
 If(ParamStr(1)='/?')or(ParamStr(1)='--help')or(ParamStr(1)='-h')or
   (ParamStr(1)='/h')or(ParamStr(1)='/H')Then Begin
  WriteLn('RGB2YUV : Cette commande permet de convertir les couleurs ',
                      'RGB (RVB) en couleur (YUV).');
  WriteLn;
  WriteLn('Syntaxe : RGB2YUV r g b');
  WriteLn;
  WriteLn(' r  Ce parametre permet d''indiquer le rouge entre 0 et 255');
  WriteLn(' g  Ce parametre permet d''indiquer le vert entre 0 et 255');
  WriteLn(' b  Ce parametre permet d''indiquer le bleu entre 0 et 255');
 End
  Else
 If ParamCount=3Then Begin
  Val(ParamStr(1),R,Err);
  If Err>0Then Begin
   WriteLn('Valeur rouge invalide');
   Halt;
  End;
  Val(ParamStr(2),G,Err);
  If Err>0Then Begin
   WriteLn('Valeur vert invalide');
   Halt;
  End;
  Val(ParamStr(3),B,Err);
  If Err>0Then Begin
   WriteLn('Valeur bleu invalide');
   Halt;
  End;
  Y:=Trunc(0.3*R+0.59*G+0.11*G);
  U:=Trunc((B-Y)*0.493);
  V:=Trunc((R-Y)*0.877);
  WriteLn('Y = ',Y:1:0);
  WriteLn('U = ',U:1:0);
  WriteLn('V = ',V:1:0);
 End
  Else
 WriteLn('Nombre de parametre invalide');
END.